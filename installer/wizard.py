from os import path, getenv
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

