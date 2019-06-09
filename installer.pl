#!/usr/bin/env perl

use 5.12.0;
use warnings;
use utf8;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';

require './tools/installer/Interactive.pm';

Interactive::sayCheck('Checking Interactive module');
Interactive::sayOk();

my $seled = Interactive::showMenu('おっぱい', ('まんこ', 'まんこ', 'ちんこ'));
Interactive::dieWithError('abc');
