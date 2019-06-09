package GitHub;

use Interactive;

sub cloneAt {
  my ($repository, $baseDir, $repoName) = @_;
  my $repoUrl = 'https://github.com/' . $repository;
  my @args = ('git', 'clone', '--depth', 1, $repoUrl);
  system(@args) or Interactive::dieWithError($!);
}

