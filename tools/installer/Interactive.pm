package Interactive;

use Scalar::Util qw(looks_like_number);

our $esError = '31';
our $esSuccess = '32';
our $esHeader = '34';

sub printEscape {
  my ($command, $text) = @_;
  print "\e[" . $command . 'm' . $text . "\e[m";
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

1;

