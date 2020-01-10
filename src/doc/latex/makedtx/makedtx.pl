#!/usr/bin/perl

# File          : makedtx
# Author        : Dr Nicola Talbot
# Date          : 29 Oct 2004
# Last Modified : 11 Feb 2005
# Version       : 0.9b

# usage : makedtx [options] -src <expr>=><expr> -doc <filename> <basename>
#
# -h  : help message
# -src <expr>=><expr> : e.g. -src "(foo)src\.(bar)=>$1.$2" will add foosrc.bar to <basename>.dtx to be extracted to foo.bar
# -doc <filename> : file containing documentation.
# <basename> : create <basename>.dtx and <basename>.ins

use Getopt::Long;

$version = "0.9b";

# process command line options

 %optctl = ();

&GetOptions(\%optctl, "h", "help", "v", "src=s@", "doc=s", "dir=s", "op=s", "askforoverwrite!", "ins!",
                      "preamble=s", "postamble=s", "setambles=s@", "macrocode=s@",
                      "author=s", "date=s", "stopeventually=s") or syntaxerror();

$srcdir          = ".";
$patternop       = "=";
$verbose         = 0;
$noins           = 0;
$askforoverwrite = 0;
$preamble        = "";
$postamble       = "";
$author          = ($ENV{'USER'} || "Unknown");
$stopeventually  = "";

($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);

$year = $year + 1900;

foreach $setting (keys %optctl)
{
   if (($setting eq "h") || ($setting eq "help"))
   {
      help();
   }
   elsif ($setting eq "doc")
   {
      $docsrc   = $optctl{$setting};
   }
   elsif ($setting eq "src")
   {
      @source = @{ $optctl{$setting} };
   }
   elsif ($setting eq "dir")
   {
      $srcdir = $optctl{$setting};
   }
   elsif ($setting eq "op")
   {
      $patternop = $optctl{$setting};
   }
   elsif ($setting eq "v")
   {
      $verbose = 1;
   }
   elsif ($setting eq "ins")
   {
      $noins = 1-$optctl{$setting};
   }
   elsif ($setting eq "askforoverwrite")
   {
      $askforoverwrite = $optctl{$setting};
   }
   elsif ($setting eq "preamble")
   {
      $preamble = $optctl{$setting};
   }
   elsif ($setting eq "postamble")
   {
      $postamble = $optctl{$setting};
   }
   elsif ($setting eq "setambles")
   {
      @setambles = @{ $optctl{$setting} };
   }
   elsif ($setting eq "macrocode")
   {
      @macrocode = @{ $optctl{$setting} };
   }
   elsif ($setting eq "author")
   {
      $author = $optctl{$setting};
   }
   elsif ($setting eq "date")
   {
      $year = $optctl{$setting};
   }
   elsif ($setting eq "stopeventually")
   {
      $stopeventually = $optctl{$setting};
   }
}

if ($preamble eq "")
{
   $preamble = "Copyright (C) $year $author, all rights reserved.\n";
   $preamble = $preamble . "If you modify this file, you must change its name first.\n";
   $preamble = $preamble . "You are NOT ALLOWED to distribute this file alone. You are NOT\n";
   $preamble = $preamble . "ALLOWED to take money for the distribution or use of either this\n";
   $preamble = $preamble . "file or a changed version, except for a nominal charge for copying\n";
   $preamble = $preamble . "etc.";
}

if ($docsrc eq "")
{
   print "No document source specified (missing -doc)\n";
   syntaxerror();
}

if ($#ARGV != 0)
{
   print "No basename specified\n";
   syntaxerror();
}

if ($#source == -1)
{
   print "No source code specified (missing -src)\n";
   syntaxerror();
}

$basename = $ARGV[0];

open DTX, ">$basename.dtx" or die "Can't open '$basename.dtx'\n";

if ($verbose)
{
   print "Documentation source : " . $docsrc . "\n";
}

open DOC, $docsrc or die "Can't open '$docsrc'\n";

print DTX "\%\\iffalse\n";
print DTX "\% $basename.dtx generated using $0 version $version (c) Nicola Talbot\n";
print DTX "\% Command line args:\n";

foreach $setting (keys %optctl)
{
   if ($setting eq "src")
   {
      foreach $source (@source)
      {
         print DTX "\%   -src \"$source\"\n";
      }
   }
   elsif ($setting eq "setambles")
   {
      foreach $setamble (@setambles)
      {
         print DTX "\%   -setambles \"$setamble\"\n";
      }
   }
   elsif ($setting eq "macrocode")
   {
      foreach $macrocode (@macrocode)
      {
         print DTX "\%   -macrocode \"$macrocode\"\n";
      }
   }
   else
   {
      print DTX "\%   -", $setting, " \"",  $optctl{$setting}, "\"\n";
   }
}

print DTX "\%   $basename\n";
print DTX "\% Created on $year/", $mon+1, "/$mday $hour:", $min<10?"0$min" : $min,"\n";
print DTX "\%\\fi\n";
print DTX "\%\\iffalse\n";
print DTX "\%<*package>\n";
print DTX "\%\% \\CharacterTable\n";
print DTX "\%\%  {Upper-case    \\A\\B\\C\\D\\E\\F\\G\\H\\I\\J\\K\\L\\M\\N\\O\\P\\Q\\R\\S\\T\\U\\V\\W\\X\\Y\\Z\n";
print DTX "\%\%   Lower-case    \\a\\b\\c\\d\\e\\f\\g\\h\\i\\j\\k\\l\\m\\n\\o\\p\\q\\r\\s\\t\\u\\v\\w\\x\\y\\z\n";
print DTX "\%\%   Digits        \\0\\1\\2\\3\\4\\5\\6\\7\\8\\9\n";
print DTX "\%\%   Exclamation   \\!     Double quote  \\\"     Hash (number) \\#\n";
print DTX "\%\%   Dollar        \\\$     Percent       \\\%     Ampersand     \\&\n";
print DTX "\%\%   Acute accent  \\\'     Left paren    \\(     Right paren   \\)\n";
print DTX "\%\%   Asterisk      \\*     Plus          \\+     Comma         \\,\n";
print DTX "\%\%   Minus         \\-     Point         \\.     Solidus       \\/\n";
print DTX "\%\%   Colon         \\:     Semicolon     \\;     Less than     \\<\n";
print DTX "\%\%   Equals        \\=     Greater than  \\>     Question mark \\?\n";
print DTX "\%\%   Commercial at \\\@     Left bracket  \\[     Backslash     \\\\\n";
print DTX "\%\%   Right bracket \\]     Circumflex    \\^     Underscore    \\_\n";
print DTX "\%\%   Grave accent  \\\`     Left brace    \\{     Vertical bar  \\|\n";
print DTX "\%\%   Right brace   \\}     Tilde         \\~}\n";
print DTX "\%</package>\n";
print DTX "\%\\fi\n";

print DTX "\% \\iffalse\n";
print DTX "\% Doc-Source file to use with LaTeX2e\n";
print DTX "\% Copyright (C) $year $author, all rights reserved.\n";
print DTX "\% \\fi\n";

# driver

print DTX "\% \\iffalse\n";
print DTX "\%<*driver>\n";

$indoc=0;

while (<DOC>)
{
   s/\\usepackage{creatdtx}//;

   $restofline = $_;

   $beginline = "";
   $line = $restofline;

   while ($restofline =~ /(.*)\\ifmakedtx(.*)/)
   {
      $beginline = $1;

      ($group,$restofline,$done) = getnextgroup($2);

      $startline = $.;

      while (!$done)
      {
         if ($nextline = <DOC>)
         {
            $line = $line . $nextline;

            $restofline = $restofline . $nextline;

            ($group,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\ifmakedtx on line $startline\n";
         }
      }

      # print first arg, ignore second

      $beginline = $beginline . $group;

      ($group,$restofline,$done) = getnextgroup($restofline);

      while (!$done)
      {
         if ($nextline = <DOC>)
         {
            $line = $line . $nextline;

            $restofline = $restofline . $nextline;

            ($group,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning second argument to \\ifmakedtx on line $startline\n";
         }
      }

      $line = $restofline;
   }

   $line = $beginline . $restofline;

   print DTX $line;

   if ($line=~/\\begin{document}/)
   {
      $indoc = 1;

      last;
   }
}

print DTX "\\DocInput{$basename.dtx}\n";
print DTX "\\end{document}\n";
print DTX "\%</driver>\n";
print DTX "\%\\fi\n";

$inverb=0;
$stopfound=0;

print DTX "\%";

while (<DOC>)
{
   if (/\\begin{verbatim}/)
   {
      $inverb=1;
   }

   if (/\\end{verbatim}/)
   {
      $inverb=0;
   }

   if (/\\StopEventually/ && ($inverb==0))
   {
      $stopfound=1;
   }

   $restofline = $_;

   $beginline = "";
   $line = $restofline;

   while ($restofline =~ /(.*)\\ifmakedtx(.*)/)
   {
      $beginline = $1;

      ($group,$restofline,$done) = getnextgroup($2);

      $startline = $.;

      while (!$done)
      {
         if ($nextline = <DOC>)
         {
            $line = $line . $nextline;

            $restofline = $restofline . $nextline;

            ($group,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\ifmakedtx on line $startline\n";
         }
      }

      # print first arg, ignore second

      $beginline = $beginline . $group;

      ($group,$restofline,$done) = getnextgroup($restofline);

      while (!$done)
      {
         if ($nextline = <DOC>)
         {
            $line = $line . $nextline;

            $restofline = $restofline . $nextline;

            ($group,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning second argument to \\ifmakedtx on line $startline\n";
         }
      }

      $line = $restofline;
   }

   $line = $beginline . $restofline;

   if (($line=~/\\end{document}/) and not $inverb)
   {
      $indoc=0;

      $line=~s/\\end{document}//;
   }

   $line=~s/\n/\n\%/mg;

   print DTX "$line";
}

close DOC;

print DTX "\n";

if ($stopfound==0)
{
   print DTX "\%\\StopEventually{$stopeventually}\n";
}

print DTX "\%\\section{The Code}\n";

@srcdirfile = glob("$srcdir/*");

 %file = ();

foreach $source (@source)
{
   ($infile, $outfile, $remainder) = split /=>/, $source;

   if ($outfile eq "")
   {
      print "-src $source argument invalid (no output file specified)\n";

      syntaxerror();
   }

   if (not ($remainder eq ""))
   {
      print "-src $source argument invalid (too many => specified)\n";

      syntaxerror();
   }

   foreach $srcdirfile (@srcdirfile)
   {
      $fileexp = $srcdir . "/" . $infile;

      $_ = $srcdirfile;

      $expr = "s$patternop$fileexp$patternop$outfile$patternop";

      if (eval($expr))
      {
         if ($verbose)
         {
            print "$srcdirfile -> $_ \n";
         }

         $thisoutfile = $_;

         $thisinfile  = $srcdirfile;

         open SRC, $thisinfile or die "Can't open $thisinfile\n";

         print DTX "\%    \\begin{macrocode}\n";
         print DTX "\%<*$thisoutfile>\n";
         print DTX "\%    \\end{macrocode}\n";

         $macrocode = 0;

         foreach $expr (@macrocode)
         {
            if ($thisoutfile =~ m/$expr/)
            {
               print DTX "\%    \\begin{macrocode}\n";

               $macrocode = 1;
            }
         }

         while (<SRC>)
         {
            print DTX "$_";
         }

         if ($macrocode == 1)
         {
            print DTX "\%    \\end{macrocode}\n";
         }

         print DTX "\%    \\begin{macrocode}\n";
         print DTX "\%</$thisoutfile>\n";
         print DTX "\%    \\end{macrocode}\n";

         close SRC;

         $file{$thisinfile} = $thisoutfile;
      }
   }
}

print DTX "\%\\Finale\n";
print DTX "\\endinput\n";

close DTX;

if (!$noins)
{
   open INS, ">$basename.ins" or die "Can't open '$basename.ins'\n";

   print INS "\% $basename.ins generated using $0 version $version $year/",$mon+1,"/$mday $hour:", $min<10?"0$min":$min,"\n";

   print INS "\\input docstrip\n\n";
   print INS "\\preamble\n";
   print INS "$preamble\n";
   print INS "\\endpreamble\n\n";

   if ($postamble ne "")
   {
      print INS "\\postamble\n";
      print INS "$postamble\n";
      print INS "\\endpostamble\n\n";
   }

   if ($askforoverwrite)
   {
      print INS "\\askforoverwritetrue\n\n";
   }
   else
   {
      print INS "\\askforoverwritefalse\n\n";
   }

   print INS "\\generate{";

   foreach $file (keys %file)
   {
      $outfile = $file{$file};

      print INS "\\file{$outfile}{";

      $ambleset = 0;
      $noamble  = 0;

      foreach $setamble (@setambles)
      {
         ($fileexp, $amble, $remainder) = split /=>/, $setamble;

         if (not ($remainder eq ""))
         {
            die "-setambles $setamble argument invalid (too many => specified)\n";
         }

         if ($outfile =~ m/$fileexp/)
         {
            if ($verbose)
            {
               print "$fileexp matches $outfile -> setting \"$amble\"\n";
            }

            print INS $amble;

            $ambleset = 1;

            if ($amble =~ m/\\nopreamble/)
            {
               $noamble = 1;
            }
         }
      }

      if (!$ambleset)
      {
         print INS "\\usepreamble\\defaultpreamble\n\\usepostamble\\defaultpostamble";
      }

      print INS "\\from{$basename.dtx}{$outfile";

      if ($noamble == 0)
      {
         # this will add the character table to all files except those that use \nopreamble

         print INS ",package";
      }

      print INS "}}\n";
   }

   print INS "}\n\n";

   print INS "\\endbatchfile\n";

   close INS;
}

sub syntaxerror
{
   die "Syntax : $0 [options] <basename>\nUse -h for help\n";
}

sub help
{
   print "$0 Help\n\n";

   print "Current Version : $version\n\n";

   print "usage : $0 [options] -src \"<expr>=><expr>\" -doc <filename> <basename>\n\n";

   print "$0 can be used to construct a LaTeX2e dtx and ins file from\n";
   print "the specified source code.  The final command line argument\n";
   print "<basename> should be used to specify the basename of the dtx\n";
   print "and ins files.\n\n";

   print "-src \"<expr1>=><expr2>\"\n";
   print "The command line switch -src identifies the original source code and the name\n";
   print "of the file to which it will utimately be extracted on latexing the ins file\n";
   print "<expr1> can be a Perl expression, such as (foo)src.(sty), and <expr2> can\n";
   print "a Perl substitution style expression, such as $1.$2\n";
   print "Note that double quotes must be used to prevent shell expansion\n";
   print "Multiple invocations of -src are permitted\n";
   print "See examples below.\n\n";

   print "-doc <filename>\n";
   print "The name of the documentation source code.  This should be a LaTeX2e document\n\n";

   print "Optional Arguments:\n\n";

   print "-dir <directory> : search for source files in <directory>\n";
   print "-op <character>  : set the pattern matching operator (default '$patternop')\n";
   print "-askforoverwrite : set askforoverwrite switch in INS file to true\n";
   print "-noaskforoverwrite : set askforoverwrite switch in INS file to false (default)\n";
   print "-preamble <text> : set the preamble.  Standard one inserted if omitted\n";
   print "-postamble <text> : set the postamble.\n";
   print "-setambles \"<pattern>=><text>\" : set pre- and postambles to <text> if file matches pattern\n";
   print "-author <text>   : name of author (inserted into standard preamble. User name inserted if omitted)\n";
   print "-date <text>     : copyright date\n";
   print "-ins             : create the ins file (default)\n";
   print "-noins           : don't create the ins file\n";
   print "-h               : help message\n";
   print "-v               : verbose\n\n";

   print "Examples:\n\n";

   print "Example 1:\n";
   print "Documenation is in foodoc.tex\n";
   print "Source code is in foosrc.sty.  The final extracted version should be \n";
   print "called foo.sty. The dtx file should be called foo.dtx and the ins file\n";
   print " should be called foo.ins\n\n";

   print "$0 -src \"foosrc\\.sty=>foo.sty\" -doc foodoc.tex foo\n\n";

   print "Example 2:\n";
   print "Documenation is in bardoc.tex\n";
   print "Source code is in barsrc.sty.  The final extracted version should be\n";
   print "called bar.sty.  Source code is also in barsrc.bst.  The final extracted\n";
   print "version should be called bar.bst.  The dtx file should be called bar.dtx and\n";
   print "the ins file should be called bar.ins\n\n";

   print "$0 -src \"barsrc\\.sty=>bar.sty\" -src \"barsrc\\.bst=>bar.bst\" -doc bardoc.tex bar\n\n";

   print "Or\n\n";

   print "$0 -src \"barsrc\\.(bst|sty)=>bar.\$1\" -doc bardoc.tex bar\n\n";

   die;
}

sub eatinitialspaces
{
   my ($STR) = @_;

   while (substr($STR,0,1) eq "\s")
   {
      $STR = substr($STR,1);
   }

   return $STR;
}

sub getnextgroup
{
   my($curline) = @_;

   $curline = eatinitialspaces($curline);

   # check to see if current string is blank

   if ($curline!~/[^\s]+/m)
   {
      return ("","",0);
   }

   if (($group = substr($curline,0,1)) ne "{")
   {
       # next group hasn't been delimited with braces
       # return first non-whitespace character

       $curline = substr($curline,1);

       # unless it's a backslash, in which case get command name

       if ($group eq "\\")
       {
          if ($curline=~/([a-zA-Z]+)(^[a-zA-Z].*)/m)
          {
             $group = $1;

             $curline = $2;
          }
          else
          {
             # command is made up of backslash followed by symbol

             $curline=~/([\W_0-9\s\\])(.*)/m;

             $group = $1;

             $curline = $2;
          }
       }

       return ($group,$curline,1);
   }

   my $pos=index($curline, "{");
   my $startpos=$pos;
   my $posopen=0;
   my $posclose=0;

   my $bracelevel = 1;

   my $done=0;

   while (!$done)
   {
      $pos++;

      $posopen = index($curline, "{", $pos);

      # check to make sure it's not a \{

      while ((substr($curline, $posopen-1,1) eq "\\") and ($posopen > 0))
      {
         # count how many backlashes come before it.

         $i = $posopen-1;

         $numbs = 1;

         while ((substr($curline, $i-1,1) eq "\\") and ($i > 0))
         {
            $numbs++;
            $i--;
         }

         # is $numbs is odd, we have a \{, otherwise we have \\{

         if ($numbs%2 == 0)
         {
            last;
         }
         else
         {
            $posopen = index($curline, "{", $posopen+1);
         }
      }

      $posclose= index($curline, "}", $pos);

      # check to make sure it's not a \}

      while ((substr($curline, $posclose-1,1) eq "\\") and ($posclose > 0))
      {
         # count how many backlashes come before it.

         $i = $posclose-1;

         $numbs = 1;

         while ((substr($curline, $i-1,1) eq "\\") and ($i > 0))
         {
            $numbs++;
            $i--;
         }

         # is $numbs is odd, we have a \}, otherwise we have \\}

         if ($numbs%2 == 0)
         {
            last;
         }
         else
         {
            $posclose = index($curline, "}", $posclose+1);
         }
      }

      if (($posopen==-1) and ($posclose==-1))
      {
         $done=1;
      }
      elsif ($posopen==-1)
      {
         $pos=$posclose;

         $bracelevel--;

         if ($bracelevel==0)
         {
            $group = substr($curline, $startpos+1, $pos-$startpos-1);

            $curline = substr($curline, $pos+1);

            return ($group,$curline,1);
         }
      }
      elsif ($posclose==-1)
      {
         $pos=$posopen;

         $bracelevel++;
      }
      elsif ($posopen<$posclose)
      {
         $pos=$posopen;

         $bracelevel++;
      }
      elsif ($posclose<$posopen)
      {
         $pos=$posclose;

         $bracelevel--;

         if ($bracelevel==0)
         {
            $group = substr($curline, $startpos+1, $pos-$startpos-1);

            $curline = substr($curline, $pos+1);

            return ($group,$curline,1);
         }
      }
   }

   # closing brace must be on another line

   return ("", $curline, 0);
}
1;
