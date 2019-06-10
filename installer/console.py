# コンソールに様々を表示する

import sys

def banner():
    """
    バナーを出力
    """
    print(
    """
--------------------------------------------------------------------------------
               ╺┳┓┏━┓╺┳╸┏━╸╻╻  ┏━╸┏━┓   ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━╸┏━┓
                ┃┃┃ ┃ ┃ ┣╸ ┃┃  ┣╸ ┗━┓   ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣╸ ┣┳┛
               ╺┻┛┗━┛ ╹ ╹  ╹┗━╸┗━╸┗━┛   ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸┗━╸╹┗╸
--------------------------------------------------------------------------------
    """
    )

def title(msg: str):
    """
    タイトルを表示する
    (太字・白)
    """
    print('\x1b[1;37m# {}\x1b[m'.format(msg))

def waiting(msg: str):
    """
    なんか待機するときに出す(改行なし)
    (青)
    """
    print('\x1b[34m{}...\x1b[m'.format(msg), end='', flush=True)

def fatal(msg: str, quit_now = False):
    """
    致命的なエラー、終了する
    (太字・赤地に白)
    """
    print('\x1b[1;7;31;47m{}\x1b[m'.format(msg))
    if quit_now: sys.exit(1)

def ok():
    """
    [OK]
    (緑)
    """
    print('\x1b[32m[OK]\x1b[m')

def ng():
    """
    [NG]
    (赤)
    """
    print('\x1b[31m[NG]\x1b[m')

