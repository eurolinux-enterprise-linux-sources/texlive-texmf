#!/usr/bin/perl

# File        : csvtools.pl
# Author      : Dr Nicola Talbot
# Date        : 14 Oct 2004
# Description : Perl script to accompany csvtools.sty
#             : Allows you to substitute \CSVtotabular, \CSVtolongtable and \applyCSVfile commands with the appropriate LaTeX code
# Version     : 0.5b (18 October 2004).

# usage : csvtools <in-file> <out-file>

if ($#ARGV != 1)
{
   die "Syntax : $0 <in-file> <out-file>\n";
}

($FILENAME,$OUTPUT) = @ARGV;

open FILENAME or die "Can't open '$FILENAME'\n";

$ext = substr($FILENAME, -4);

if (($ext eq ".tex") or ($ext eq ".dtx") or ($ext eq ".ltx"))
{
   $LOGFILE =  substr($FILENAME,0,length($FILENAME)-4) . ".log";
}
else
{
   $LOGFILE = $FILENAME . ".log";
}

open LOGFILE or die "Can't open log file '$LOGFILE'.  Make sure you run LaTeX before using $0\n";


while (<LOGFILE>)
{
   if (/\\c@([a-zA-Z]+)=\\count/)
   {
      $counter{$1} = 0;
   }
}

$counter{csvrownumber} = 0;

close LOGFILE;

open OUTPUT, ">$OUTPUT" or die;


while (<FILENAME>)
{
   $restofline = $_;

   while ($restofline=~/\\stepcounter(.*)/)
   {
      $line = $_;

      ($ctr,$restofline,$done) = getnextgroup($1);

      $startline=$.;

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

             $restofline = $restofline . $nextline;

             ($ctr,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\stepcounter on line $startline\n";
         }
      }

      $counter{$ctr}++;

      $_ = $line;
   }

   $restofline = $_;

   while ($restofline=~/\refstepcounter(.*)/)
   {
      $line = $_;

      ($ctr,$restofline,$done) = getnextgroup($1);

      $startline=$.;

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

             $restofline = $restofline . $nextline;

             ($ctr,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\stepcounter on line $startline\n";
         }
      }

      $counter{$ctr}++;

      $_ = $line;
   }

   $restofline = $_;

   while ($restofline=~/\\setcounter(.*)/)
   {
      $line = $_;

      ($ctr,$restofline,$done) = getnextgroup($1);

      $startline=$.;

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

             $restofline = $restofline . $nextline;

             ($ctr,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\stepcounter on line $startline\n";
         }
      }

      ($num,$restofline,$done) = getnextgroup($restofline);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

             $restofline = $restofline . $nextline;

             ($num,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning second argument to \\stepcounter on line $startline\n";
         }
      }

      $num=~s/\\value{(.+)}/$counter{$1}/;

      $counter{$ctr} = $num;

      $_ = $line;
   }

   $restofline = $_;

   while ($restofline=~/\\addtocounter(.*)/)
   {
      $line = $_;

      ($ctr,$restofline,$done) = getnextgroup($1);

      $startline=$.;

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

             $restofline = $restofline . $nextline;

             ($ctr,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\stepcounter on line $startline\n";
         }
      }

      ($num,$restofline,$done) = getnextgroup($restofline);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

             $restofline = $restofline . $nextline;

             ($num,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning second argument to \\stepcounter on line $startline\n";
         }
      }

      $num=~s/\\value{(.+)}/$counter{$1}/;

      $counter{$ctr} = $counter{$ctr} + $num;

      $_ = $line;
   }

   $restofline = $_;

   while ($restofline=~/^(.*)\\csvGetEntry(.*)$/)
   {
      $start = $1;
      $restofline = $2;

      ($ctr,$restofline,$done) = getnextgroup($restofline);

      $startline=$.;

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $restofline = $restofline . $nextline;

             ($ctr,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\csvGetEntry on line $startline\n";
         }
      }

      ($entry,$restofline,$done) = getnextgroup($restofline);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $restofline = $restofline . $nextline;

             ($entry,$restofline,$done) = getnextgroup($restofline);
         }
         else
         {
            die "EOF found whilst scanning first argument to \\csvGetEntry on line $startline\n";
         }
      }
      $_ = $start . "\\csname $entry\\roman{$ctr}\\endcsname" . $restofline;
      #$_ = $start. $data{$entry}[$counter{$ctr}] . $restofline;
   }

   if (/^(.*)\\CSVtotabular(.*)$/)
   {
      print OUTPUT "$1\n";

      $line = $2;

      ($csvname,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

            ($csvname,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for CVS filename on line $.\n";
         }
      }

      $csvname=~s/\\csname (.*)\\roman{(.*)}\\endcsname/$data{$1}[$counter{$2}]/;

      $line = $restofline;

      ($alignment,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($alignment,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for CVS column alignment on line $.\n";
         }
      }

      $line = $restofline;

      ($FIRST,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($FIRST,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\CSVtotabular third argument on line $.\n";
         }
      }

      $line = $restofline;

      ($MIDDLE,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($MIDDLE,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\CSVtotabular fourth argument on line $.\n";
         }
      }

      $line = $restofline;

      ($LAST,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($LAST,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\CSVtotabular fifth argument on line $.\n";
         }
      }

      csvtotabular($csvname, $alignment, $FIRST, $MIDDLE, $LAST);

      print OUTPUT "$restofline\n";
   }
   elsif (/^(.*)\\CSVtolongtable(.*)$/)
   {
      print OUTPUT "$1\n";

      $line = $2;

      ($csvname,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $line . $nextline;

            ($csvname,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for CVS filename on line $.\n";
         }
      }

      $csvname=~s/\\csname (.*)\\roman{(.*)}\\endcsname/$data{$1}[$counter{$2}]/;

      $line = $restofline;

      ($alignment,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($alignment,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for CVS column alignment on line $.\n";
         }
      }

      $line = $restofline;

      ($FIRST,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($FIRST,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\CSVtolongtable third argument on line $.\n";
         }
      }

      $line = $restofline;

      ($MIDDLE,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($MIDDLE,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\CSVtolongtable fourth argument on line $.\n";
         }
      }

      $line = $restofline;

      ($LAST,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline = <FILENAME>)
         {
             $line = $restofline . $nextline;

            ($LAST,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\CSVtolongtable fifth argument on line $.\n";
         }
      }

      csvtolongtable($csvname, $alignment, $FIRST, $MIDDLE, $LAST);

      print OUTPUT "$restofline\n";
   }
   elsif (/^(.*)\\applyCSVfile\*(.*)$/)
   {
      print OUTPUT $1;

      $restofline = $2;

      $restofline = eatinitialspaces($restofline);
      $restofline = eatcomments($restofline);

      $startrow=1;

      if (/^\[([0-9]+)\](.*)/)
      {
         $startrow = $1;

         $restofline = $2;
      }

      $line=$restofline;

      ($csvname,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline= <FILENAME>)
         {
            $line = $restofline . $nextline;

            ($csvname,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\applyCSVfile*[$startrow] first argument on line $.\n";
         }
      }

      $csvname=~s/\\csname (.*)\\roman{(.*)}\\endcsname/$data{$1}[$counter{$2}]/;

      $line=$restofline;

      ($body,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline= <FILENAME>)
         {
            $line = $restofline . $nextline;

            ($body,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\applyCSVfile*[$startrow] second argument on line $.\n";
         }
      }

      applyCSVfilestar($csvname, $body, $startrow);

      print OUTPUT "$restofline\n";
   }
   elsif (/^(.*)\\applyCSVfile(.*)$/)
   {
      print OUTPUT $1;

      $restofline = $2;

      $restofline = eatinitialspaces($restofline);
      $restofline = eatcomments($restofline);

      $startrow=2;

      if ($restofline=~/^\[(\d+)\](.*)/)
      {
         $startrow = $1;

         $restofline = $2;
      }

      $line=$restofline;

      ($csvname,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline= <FILENAME>)
         {
            $line = $restofline . $nextline;

            ($csvname,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\applyCSVfile[$startrow] first argument on line $.\n";
         }
      }

      $line=$restofline;

      ($body,$restofline,$done) = getnextgroup($line);

      while (!$done)
      {
         if ($nextline= <FILENAME>)
         {
            $line = $restofline . $nextline;

            ($body,$restofline,$done) = getnextgroup($line);
         }
         else
         {
            die "EOF found whilst scanning for \\applyCSVfile[$startrow] second argument on line $.\n";
         }
      }

      applyCSVfile($csvname, $body, $startrow);

      print OUTPUT "$restofline\n";
   }
   else
   {
      print OUTPUT;
   }
}

sub applyCSVfile
{
   my ($CSVFILE,$body,$startrow) = @_;

   print "Converting \\applyCSVfile{$CSVFILE}";
   print OUTPUT "\% \\applyCSVfile{$CSVFILE}... converted using $0\n";
   print OUTPUT "\%>> START INSERT\n";
   print OUTPUT "\\setcounter{csvrownumber}{0}";
   $counter{csvrownumber} = 0;

   open FH, $CSVFILE or die "Can't open file '$CSVFILE'\n";

   $csvrow=0;

   while (<FH>)
   {
      if ($. == 1)
      {
         # get header row

         chop;

         @fields = split /,/;

         $numcols = 1;

         foreach $field (@fields)
         {
            $idx{$field} = $numcols;

            $numcols++;
         }
      }
      elsif ($. >= $startrow)
      {
         next unless /,/;

         chop;

         $csvrow++;
         $rec = {};

         $HoH[$csvrow] = $rec;

         @entries = split /,/;

         $i = 0;

         foreach $e (@entries)
         {
            $rec->{$fields[$i]} = $e;
            $i++;
         }
      }
   }

   close FH;

   foreach ($row=1; $row <= $csvrow; $row++)
   {
      print ".";

      $THISROW = $body;

      $THISROW = csvSaveEntry($THISROW,$row,%HoH);

      foreach $entry ( keys %{$HoH[$row]})
      {
          $replacementval=$HoH[$row]{$entry};

          $THISROW =~ s/\\insertbyname{$entry}/$replacementval/g;

          $THISROW =~ s/\\insert$entry/$replacementval/g;

          $column = $idx{$entry};

          $THISROW =~ s/\\field{$column}/$replacementval/g;

          $THISROW = ifnextrowlast($THISROW, ($row==$csvrow-1));
      }

      print OUTPUT "\\stepcounter{csvrownumber}$THISROW";
      $counter{csvrownumber}++;
   }

   print "\n";

   print OUTPUT "\%<< END INSERT\n";
}

sub csvSaveEntry
{
   my ($STR,$row,%HoH) = @_;

   $rowctr = "csvrownumber";

   while (($pos = index($STR, "\\csvSaveEntry")) > -1)
   {
      $start      = substr($STR,0,$pos);
      $restofline = substr($STR,$pos+13);

      $restofline = eatcomments($restofline);
      $restofline = eatinitialspaces($restofline);

      if ($restofline[0] eq "[")
      {
         if (($i = index($restofline,"]")) > -1)
         {
            $rowctr = substr($restofline, 1, $i-1);

            $restofline = substr($restofline, $i+1);
         }
         else
         {
            die "unmatched [ in \\csvSaveEntry\n";
         }

         $row = $counter{$rowctr};
      }

      ($group,$restofline,$done) = getnextgroup($restofline);

      if (!$done)
      {
         die "argument to \\csvSaveEntry[$rowctr] not found in >>$restofline<<\n";
      }

      $val = $HoH[$row]{$group};

      $STR = $start . "\\expandafter\\gdef\\csname $group\\roman{$rowctr}\\endcsname{$val}" . $restofline;

      $data{$group}[$row] = $HoH[$row]{$group};
   }

   return $STR;
}

sub applyCSVfilestar
{
   my ($CSVFILE,$body,$startrow) = @_;

   print "Converting \\applyCSVfile*{$CSVFILE}";
   print OUTPUT "\\setcounter{csvrownumber}{0}";
   $counter{csvrownumber} = 0;

   open FH, $CSVFILE or die "Can't open file '$CSVFILE'\n";

   $csvrow=0;

   while (<FH>)
   {
      if ($. >= $startrow)
      {
         $csvrow++;

         chop;

         @fields = split /,/;

         $numcols = 1;

         foreach $field (@fields)
         {
            $entry[$csvrow][$numcols-1] = $field;

            $numcols++;
         }
      }
   }

   close FH;

   for ($row=0; $row < $csvrow; $row++)
   {
      print ".";

      $THISROW = $body;

      for ($column=0; $column < $numcols; $column++)
      {
          $replacementval=$entry[$row][$column];

          $THISROW =~ s/\\field{$column}/$replacementval/g;

          $THISROW = ifnextrowlast($THISROW, ($row==$csvrow-1));
      }

      print OUTPUT "\\stepcounter{csvrownumber}$THISROW";
      $counter{csvrownumber}++;
   }

   print "\n";

   print OUTPUT "\%<< END INSERT\n";
}

sub csvtotabular
{
   my ($CSVFILE,$ALIGN,$START,$MID,$END) = @_;

   print "Converting \\CSVtotabular{$CSVFILE}";

   print OUTPUT "\% \\CSVtotabular{$CSVFILE}... converted using $0\n";
   print OUTPUT "\%>> START INSERT\n";

   print OUTPUT "\\setcounter{csvrownumber}{0}\n";
   $counter{csvrownumber} = 0;
   print OUTPUT "\\begin{tabular}{$ALIGN}\n";

   open FH, $CSVFILE or die "Can't open file '$CSVFILE'\n";

   $csvrow=0;

   while (<FH>)
   {
      if ($. == 1)
      {
         # get header row

         chop;

         @fields = split /,/;

         $numcols = 1;

         foreach $field (@fields)
         {
            $idx{$field} = $numcols;

            $numcols++;
         }

         $csvrow++;
         $rec = {};

         $HoH[$csvrow] = $rec;

         @entries = split /,/;

         $i = 0;

         foreach $e (@entries)
         {
            $rec->{$fields[$i]} = $e;
            $i++;
         }
      }
      elsif ($. > 1)
      {
         next unless /,/;

         chop;

         $csvrow++;
         $rec = {};

         $HoH[$csvrow] = $rec;

         @entries = split /,/;

         $i = 0;

         foreach $e (@entries)
         {
            $rec->{$fields[$i]} = $e;
            $i++;
         }
      }
   }

   close FH;

   foreach ($row=1; $row <= $csvrow; $row++ )
   {
      print ".";

      if ($row == 1)
      {
         $THISROW=$START;
      }
      elsif ($row == $csvrow)
      {
         $THISROW=$END;
      }
      else
      {
         $THISROW=$MID;
      }

      foreach $entry ( keys %{$HoH[$row]})
      {
          $replacementval=$HoH[$row]{$entry};

          $THISROW =~ s/\\insertbyname{$entry}/$replacementval/g;

          $THISROW =~ s/\\insert$entry/$replacementval/g;

          $column = $idx{$entry};

          $THISROW =~ s/\\field{$column}/$replacementval/g;

          $THISROW = ifnextrowlast($THISROW, ($row==$csvrow-1));
      }

      if ($row==1)
      {
         print OUTPUT "$THISROW";
      }
      else
      {
         print OUTPUT "\\refstepcounter{csvrownumber}$THISROW";
         $counter{csvrownumber}++;
      }
   }

   print OUTPUT "\\end{tabular}";
   print OUTPUT "\%<< END INSERT\n";

   print "\n";
}

sub csvtolongtable
{
   my ($CSVFILE,$ALIGN,$START,$MID,$END) = @_;

   print "Converting \\CSVtolongtable{$CSVFILE}";

   print OUTPUT "\% \\CSVtolongtable{$CSVFILE}... converted using $0\n";
   print OUTPUT "\%>> START INSERT\n";

   print OUTPUT "\\setcounter{csvrownumber}{0}\n";
   $counter{csvrownumber} = 0;
   print OUTPUT "\\begin{longtable}{$ALIGN}\n";

   open FH, $CSVFILE or die "Can't open file '$CSVFILE'\n";

   $csvrow=0;

   while (<FH>)
   {
      if ($. == 1)
      {
         # get header row

         chop;

         @fields = split /,/;

         $numcols = 1;

         foreach $field (@fields)
         {
            $idx{$field} = $numcols;

            $numcols++;
         }

         $csvrow++;
         $rec = {};

         $HoH[$csvrow] = $rec;

         @entries = split /,/;

         $i = 0;

         foreach $e (@entries)
         {
            $rec->{$fields[$i]} = $e;
            $i++;
         }
      }
      elsif ($. > 1)
      {
         next unless /,/;

         chop;

         $csvrow++;
         $rec = {};

         $HoH[$csvrow] = $rec;

         @entries = split /,/;

         $i = 0;

         foreach $e (@entries)
         {
            $rec->{$fields[$i]} = $e;
            $i++;
         }
      }
   }

   close FH;

   print "csvrow = $csvrow\n";

   for ($row=1; $row <= $csvrow; $row++)
   {
      print ".";

      if ($row == 1)
      {
         $THISROW=$START;
      }
      elsif ($row == $csvrow)
      {
         $THISROW=$END;
      }
      else
      {
         $THISROW=$MID;
      }

      foreach $entry ( keys %{$HoH[$row]})
      {
          $replacementval=$HoH[$row]{$entry};

          $THISROW =~ s/\\insertbyname{$entry}/$replacementval/g;

          $THISROW =~ s/\\insert$entry/$replacementval/g;

          $column = $idx{$entry};

          $THISROW =~ s/\\field{$column}/$replacementval/g;

          $THISROW = ifnextrowlast($THISROW, ($row==$csvrow-1));
      }

      if ($row==1)
      {
         print OUTPUT "$THISROW";
      }
      else
      {
         print OUTPUT "\\refstepcounter{csvrownumber}$THISROW";
         $counter{csvrownumber}++;
      }
   }

   print OUTPUT "\\end{longtable}";
   print OUTPUT "\%<< END INSERT\n";

   print "\n";
}

sub ifnextrowlast
{
   my ($STR, $nextislast) = @_;

   if (($pos = index($STR, "\\ifnextrowlast")) > -1)
   {
      $strbegin = substr($STR,0,$pos);
      $strend   = substr($STR,$pos+14);

      ($firstarg,$strend,$done) = getnextgroup($strend);

      if (!$done)
      {
         die "Can't find first argument to \\ifnextrowlast\n";
      }

      ($secondarg,$strend,$done) = getnextgroup($strend);

      if (!$done)
      {
         die "Can't find second argument to \\ifnextrowlast\n";
      }

      if ($nextislast)
      {
         $STR = $strbegin . $firstarg . $strend;
      }
      else
      {
         $STR = $strbegin . $secondarg . $strend;
      }
   }

   return $STR;
}

sub eatcomments
{
   my ($STR) = @_;

   if (substr($STR,0,1) eq "%")
   {
      return "";
   }

   my $pos=1;

   if (($pos = index($STR, "%", 1)) > -1)
   {
      if (not (substr($STR, $pos-1,1) eq "\\"))
      {
         return substr($STR,0,$pos);
      }

      while ((substr($STR, $pos-1,1) eq "\\") and ($pos > 0))
      {
         # count how many backlashes come before it.

         $i = $pos-1;

         $numbs = 1;

         while ((substr($STR, $i-1,1) eq "\\") and ($i > 0))
         {
            $numbs++;
            $i--;
         }

         # is $numbs is odd, we have a \%, otherwise we have \\%

         if ($numbs%2 == 0)
         {
            # it's a comment

            return substr($STR,0,$pos);
         }
         else
         {
            # it's not a comment, carry on looking

            $pos = index($STR, "%", $pos+1);
         }
      }
   }

   return $STR;
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

   $curline = eatcomments($curline);

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
