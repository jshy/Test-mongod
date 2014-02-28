use strict;
use warnings;
use Test::More;

use lib 't/lib';
use Test::mongod;
use File::Which qw(which);
use Data::Printer;


SKIP: {
   
    skip "mongod not installed", 4 unless ( which('mongod') );

    ok my $mongod = Test::mongod->new({config_file => 't/etc/mongo.conf'}), 'got the object';
    ok -e $mongod->dbpath, '... path to db up';
    
    is $mongod->port, '50000', '... config file working';
    ok $mongod->stop, '... and break it down';
}

done_testing;
