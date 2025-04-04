#! /usr/bin/perl -w

use Socket;
use strict;

my $sock;
my $PORT = 80;
$PORT = $ARGV[0] if $ARGV[0] and $ARGV[0] >= 0 and $ARGV[0] <= 65535;

if (socket($sock, AF_INET6, SOCK_STREAM, 0)) {
    if ($PORT == 443) {
        print qq/\$SERVER["socket"] == "[::]:$PORT" {\nssl.engine = "enable"\n}\n/;
    }
    else {
        print qq/\$SERVER["socket"] == "[::]:$PORT" { }\n/;
    }
}
