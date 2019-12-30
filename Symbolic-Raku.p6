#! /opt/rakudo-pkg/bin/perl6

multi sub MAIN (Str:D $file where *.IO.f) {
	my Str:D $content = slurp $file;
	
	# Check if the program contains letters or numbers
	if $content ~~ /<:L>|<:N>/ {
		note "Code cannot contain numbers or letters ($/ at position $/.pos())";
	} else {	
		# Get input if $_ isn't set already
		$_ = slurp if !$_;
		# Suppress warnings and evaluate the program
		quietly $content.EVAL;
		# And print the topic variable
		say $_;
	}
}

my %*SUB-MAIN-OPTS = :named-anywhere;
# Helper to generate strings without using letters or numbers
multi sub MAIN($file='ignorethis', Str:D :g(:$generate)) is hidden-from-USAGE {
	
	# All allowed one byte characters
	# Exclude backslashes and single quotes to simplify it
	my @chars = grep {!/<:L+:N+['\\]>/}, 1.chr..'~';
	# All pairs of characters
	my @com = @chars X @chars;
	
	# Prioritise printable characters
	@com = sort {.[0].ord < 32,.[1].ord < 32}, @com;
	
	# Classify them by the string xor
	my %d = classify {[~^] @$_}, @com;
	
	# Print two strings, which xor'd together form the input
	say [Z~](%d{$generate.comb}[*;0]).fmt("'%s'",'~^');
}