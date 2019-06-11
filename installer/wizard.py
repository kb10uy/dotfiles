from os import path, getenv
import shutil
from installer import console
from installer.config import Configuration

class Wizard:
    def __init__(self, base: str, config: Configuration):
        """
        Parameters
        ----------------
        base: str
            dotfiles の実際のディレクトリ
        config: Configuration
            config.json をパースしたはずの Configuration
        """
        self.config = config
        self.base_dir = base

    def run(self):
        """
        インストールウィザードを実行する。
        """
        console.banner()
        self.__check_repository()
        self.__check_command('git')
        self.__check_command('python3')
        self.__check_command('pip3')
        self.__check_command('fish')
        self.__check_command('nvim')

    def __check_repository(self):
        """
        リポジトリが正しい位置に配置されているかチェックする
        されてなかった時は死ぬ
        """
        console.waiting('Checking repository location')
        expected = path.abspath(path.join(getenv('HOME'), 'dotfiles'))
        if self.base_dir == expected:
            console.ok()
        else:
            console.ng()
            console.fatal('Invalid repository location: {}'.format(base_dir))
            console.fatal('Place dotfiles repository as {}'.format(expected), True)

    def __check_command(seld, cmd: str):
        """
        指定されたコマンドが存在するか調べる
        無かったときは死ぬ

        Parameters
        ----------------
        cmd: str
            コマンド名
        """
        console.waiting('Checking whether \'{}\' exists'.format(cmd))
        if shutil.which(cmd) is not None:
            console.ok()
        else:
            console.ng()
            console.fatal('{} was not found. Install it via any means.'.format(cmd))

