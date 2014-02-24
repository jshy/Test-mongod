use strict;
use warnings;
use Test::More;

use lib 't/lib';
use Test::mongod;

ok my $mongod = Test::mongod->new, 'got the object';

ok -e $mongod->dbpath, '... path to db up';

diag $mongod->dbpath;
diag $mongod->pid;

ok $mongod->stop, '... and break it down';

done_testing;
