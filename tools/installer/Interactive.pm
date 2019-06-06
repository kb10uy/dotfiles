package Interactive;

# ==> Message...
# 形式でメッセージを表示する。改行しない。
sub sayCheck {
  my ($message) = @_;
  print "\e[34m==> $message... \e[m";
}

# [OK] を表示する。改行する。
sub sayOk {
  print "\e[32m[OK]\e[m\n";
}

# [NG] を表示する。改行する。
sub sayNg {
  print "\e[31m[NG]\e[m\n";
}

1;

