package Interactive;

use Scalar::Util qw(looks_like_number);

our $esError = '31';
our $esFatal = '1;7;31;47';
our $esSuccess = '32';
our $esHeader = '34';
our $esHighlight = '37';

sub printEscape {
  my ($command, $text) = @_;
  print "\e[" . $command . 'm' . $text . "\e[m";
}

sub printBanner {
  printEscape($esHighlight, '================================================================================');
  printEscape($esHighlight, '               ╺┳┓┏━┓╺┳╸┏━╸╻╻  ┏━╸┏━┓   ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━╸┏━┓               ');
  printEscape($esHighlight, '                ┃┃┃ ┃ ┃ ┣╸ ┃┃  ┣╸ ┗━┓   ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣╸ ┣┳┛               ');
  printEscape($esHighlight, '               ╺┻┛┗━┛ ╹ ╹  ╹┗━╸┗━╸┗━┛   ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸┗━╸╹┗╸               ');
  printEscape($esHighlight, '================================================================================');
}

# ==> Message...
# 形式でメッセージを表示する。改行しない。
sub sayCheck {
  my ($message) = @_;
  printEscape($esHeader, "==> $message... ");
}

# [OK] を表示する。改行する。
sub sayOk {
  printEscape($esSuccess, "[OK]\n");
}

# [NG] を表示する。改行する。
sub sayNg {
  printEscape($esError, "[NG]\n");
}

# メニューを表示して選択させる。
sub showMenu {
  my ($title, @selections) = @_;
  printEscape($esHeader, "# $title\n");
  for (my $i = 0; $i < @selections; ++$i) {
    printEscape($esHeader, '# ');
    print "$i: @selections[$i]\n";
  }

  while (1) {
    printEscape($esHeader, '# Type an index: ');
    my $index = <STDIN>;
    chop $index;
    if (!looks_like_number($index)) { next; }
    if ($index >= @selections) { next; }
    return $index;
  }
}

# 死ぬ
sub dieWithError {
  my ($message) = @_;
  printEscape($esFatal, $message);
  exit 1;
}

1;

