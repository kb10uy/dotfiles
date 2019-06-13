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
        self.__menu_stack = []

    def run(self):
        """
        インストールウィザードを実行する。
        """
        console.banner()
        self.__check_repository()
        for cmd in self.config.prerequisites:
            self.__check_command(cmd)

        # Execute menu
        self.__menu_stack.append(self.config.entries)
        self.__exec_menu('Select an entry by number.')

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
            console.fatal('{} was not found. Install it by any means.'.format(cmd))

    def __exec_menu(self, title: str):
        """
        メニューを表示する。

        Parameters
        ----------------
        title: str
            メニュータイトル
        """

        level = len(self.__menu_stack)
        console.highlight("{} {}".format('#' * level, title))
        for i, me in enumerate(self.__menu_stack[-1]):
            console.highlight("{} {} : {}".format('#' * level, i, me.name))

