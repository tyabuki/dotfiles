

my $line=<STDIN>;
chomp($line);
$line =~ s/\\\\/smb:\/\//si;
$line =~ s/\\/\//sig;
print $line."\n";
