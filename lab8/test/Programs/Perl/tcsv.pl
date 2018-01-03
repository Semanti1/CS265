#!/usr/bin/perl
use Text::CSV;

$version = Text::CSV->version();      # get the module version
print "version = ",$version;

$csv = Text::CSV->new();              # create a new object

$status = $csv->combine(@columns);    # combine columns into a string
$line = $csv->string();               # get the combined string

$status = $csv->parse($line);         # parse a CSV string into fields
@columns = $csv->fields();            # get the parsed fields

$status = $csv->status();             # get the most recent status
$bad_argument = $csv->error_input();  # get the most recent bad argument
