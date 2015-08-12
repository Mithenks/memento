#!/usr/bin/perl
use Memento;

if ($#ARGV > -1) {
  my $memento = {}; bless $memento, "Memento";
  $command = shift(@ARGV);
  $memento->$command(@ARGV);
}
else {
  print "._____.___ ._______._____.___ ._______.______  _____._._______\n"
       .":         |: .____/:         |: .____/:      \\ \\__ _:|: .___  \\\n"
       ."|   \\  /  || : _/\\ |   \\  /  || : _/\\ |       |  |  :|| :   |  |\n"
       ."|   |\\/   ||   /  \\|   |\\/   ||   /  \\|   |   |  |   ||     :  |\n"
       ."|___| |   ||_.: __/|___| |   ||_.: __/|___|   |  |   | \\_. ___/\n"
       ."      |___|   :/         |___|   :/       |___|  |___|   :/\n"
       ."                                                         :\n";
  print "Version: 0.1-alpha - 2015 - © Adriano Cori.\n";
}
