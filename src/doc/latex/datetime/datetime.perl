# File        : datetime.perl
# Author      : Nicola Talbot
# Date        : 3 Mar 2005
# Version     : 1.01
# Description : LaTeX2HTML implementation of datetime package.

# set up default values for internal counters.

($global{SECONDS},$global{MINUTE},$global{HOUR},$global{DAY},$global{MONTH},$global{YEAR})=localtime(time);
$global{YEAR} += 1900;
$global{MONTH}++;

$global{HOURXII}  = ($global{HOUR} == 12 ? 12 : ($global{HOUR})%12);
$global{TOHOUR} = ($global{HOUR} == 11 ? 12 :($global{HOUR}+1)%12);
$global{TOMINUTE} = ($global{MINUTE} == 0? 0 : 60 - $global{MINUTE});

package main;

&do_require_package('fmtcount');

sub do_cmd_ordinaldate{
   &do_cmd_ordinalnum(@_);
}

# define package options

sub do_datetime_long{
   &do_cmd_longdate(@_);
}

sub do_datetime_short{
   &do_cmd_shortdate(@_);
}

sub do_datetime_text{
   &do_cmd_textdate(@_);
}

sub do_datetime_ddmmyyyy{
   &do_cmd_ddmmyyyydate(@_);
}

sub do_datetime_dmyyyy{
   &do_cmd_dmyyyydate(@_);
}

sub do_datetime_ddmmyy{
   &do_cmd_ddmmyydate(@_);
}

sub do_datetime_dmyy{
   &do_cmd_dmyyyydate(@_);
}

sub do_datetime_us{
   &do_cmd_usdate(@_);
}

sub do_datetime_mmddyyyy{
   &do_cmd_mmddyyyydate(@_);
}

sub do_datetime_mdyyyy{
   &do_cmd_mdyyyydate(@_);
}

sub do_datetime_mmddyy{
   &do_cmd_mmddyydate(@_);
}

sub do_datetime_mdyy{
   &do_cmd_mdyyyydate(@_);
}

sub do_datetime_raise{
   local($tmp)="";

   $tmp .= 'sub do_cmd_fmtord{';
   $tmp .= 'local($_) = @_;';
   $tmp .= 'local($num) = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($num=$2));';
   $tmp .= 'join("", "<SUP>",$num,"</SUP>",$_);';
   $tmp .='}';

   eval($tmp);
}

sub do_datetime_level{
   local($tmp)="";

   $tmp .= 'sub do_cmd_fmtord{';
   $tmp .= 'local($_) = @_;';
   $tmp .= 'local($num) = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($num=$2));';
   $tmp .= 'join("", $num,$_);';
   $tmp .='}';

   eval($tmp);
}

sub do_datetime_dayofweek{
   &do_cmd_showdowtrue(@_);
}

sub do_datetime_nodayofweek{
   &do_cmd_showdowfalse(@_);
}

sub do_datetime_24hr{
   $tmp = 'sub do_cmd_currenttime{local($_) = @_; join(\'\', "\\\\xxivtime", $_[0]); }';

   eval($tmp);

   join('', $_[0]);
}

sub do_datetime_12hr{
   $tmp = 'sub do_cmd_currenttime{local($_) = @_; join(\'\', "\\\\ampmtime", $_[0]); }';

   eval($tmp);

   join('', $_[0]);
}

sub do_datetime_oclock{
   $tmp = 'sub do_cmd_currenttime{local($_) = @_; join(\'\', "\\\\oclock", $_[0]); }';

   eval($tmp);

   join('', $_[0]);
}

# babel stuff (Month will already be redefined by babel, so only need to change $dateformat)

sub do_datetime_austrian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateaustrian{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateaustrian(@_);
}

if (defined &austrian_today)
{
   &do_datetime_austrian(@_);
}

sub do_datetime_bahasa{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datebahasa{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datebahasa(@_);
}

if (defined &bahasa_today)
{
   &do_datetime_bahasa(@_);
}

sub do_datetime_basque{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datebasque{';
   $tmp .= '  $dateformat = "THEYEAR.eko MONTHNAME[THEMONTH] THEDAY";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datebasque(@_);
}

if (defined &basque_today)
{
   &do_datetime_basque(@_);
}

sub do_datetime_breton{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datebreton{';
   $tmp .= '  $dateformat = "{ORDINALDATE{DAY}}\\ a viz MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   $tmp = 'sub do_cmd_ordinaldate{';
   $tmp .= 'local($_) = @_;';
   $tmp .= 'local($num) = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($num=$2));';
   $tmp .= 'local($before) = $num;';

   $tmp .= 'if ($num == 1)';
   $tmp .= '{ $before .= \'a\~n\'; }';

   $tmp .= '$before . $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datebreton(@_);
}

if (defined &breton_today)
{
   &do_datetime_breton(@_);
}

sub do_datetime_bulgarian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datebulgarian{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR \\cyrg.";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datebulgarian(@_);
}

if (defined &bulgarian_today)
{
   &do_datetime_bulgarian(@_);
}

sub do_datetime_catalan{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datecatalan{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] de THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datecatalan(@_);
}

if (defined &catalan_today)
{
   &do_datetime_catalan(@_);
}

sub do_datetime_croatian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datecroatian{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR.";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datecroatian(@_);
}

if (defined &croatian_today)
{
   &do_datetime_croatian(@_);
}

sub do_datetime_czech{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateczech{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateczech(@_);
}

if (defined &czech_today)
{
   &do_datetime_czech(@_);
}

sub do_datetime_danish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datedanish{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datedanish(@_);
}

if (defined &danish_today)
{
   &do_datetime_danish(@_);
}

sub do_datetime_dutch{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datedutch{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datedutch(@_);
}

if (defined &dutch_today)
{
   &do_datetime_dutch(@_);
}

sub do_datetime_esperanto{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateesperanto{';
   $tmp .= '  $dateformat = "THEDAY--a de MONTHNAME[THEMONTH], THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateesperanto(@_);
}

if (defined &esperanto_today)
{
   &do_datetime_esperanto(@_);
}

sub do_datetime_estonian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateestonian{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR. a.";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateestonian(@_);
}

if (defined &estonian_today)
{
   &do_datetime_estonian(@_);
}

sub do_datetime_finnish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datefinnish{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datefinnish(@_);
}

if (defined &finnish_today)
{
   &do_datetime_finnish(@_);
}

sub do_datetime_french{
   local($tmp) = "";

   eval($tmp);
   $tmp .= 'sub do_cmd_datefrench{';
   $tmp .= '  $dateformat = "{ORDINALDATE{DAY}}\\ MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   $tmp = 'sub do_cmd_ordinaldate{';
   $tmp .= 'local($_) = @_;';
   $tmp .= 'local($num) = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($num=$2));';
   $tmp .= 'local($before) = $num;';

   $tmp .= 'if ($num == 1)';
   $tmp .= '{ $before .= \'\ier\'; }';

   $tmp .= '$before . $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datefrench(@_);
}

if (defined &french_today)
{
   &do_datetime_french(@_);
}

sub do_datetime_galician{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dategalician{';
   $tmp .= '  $dateformat = "THEDAY de MONTHNAME[THEMONTH] de THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dategalician(@_);
}

if (defined &galician_today)
{
   &do_datetime_galician(@_);
}

sub do_datetime_german{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dategerman{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dategerman(@_);
}

if (defined &german_today)
{
   &do_datetime_german(@_);
}

sub do_datetime_greek{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dategreek{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dategreek(@_);
}

if (defined &greek_today)
{
   &do_datetime_greek(@_);
}

sub do_datetime_icelandic{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateicelandic{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateicelandic(@_);
}

if (defined &icelandic_today)
{
   &do_datetime_icelandic(@_);
}

sub do_datetime_irish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateirish{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateirish(@_);
}

if (defined &irish_today)
{
   &do_datetime_irish(@_);
}

sub do_datetime_italian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateitalian{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateitalian(@_);
}

if (defined &italian_today)
{
   &do_datetime_italian(@_);
}

sub do_datetime_latin{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datelatin{';
   $tmp .= '  $dateformat = "ROMANNUMERALU{THEDAY} MONTHNAME[THEMONTH] ROMANNUMERALU{THEYEAR}";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datelatin(@_);
}

if (defined &latin_today)
{
   &do_datetime_latin(@_);
}

sub do_datetime_lsorbian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datelsorbian{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datelsorbian(@_);
}

if (defined &lsorbian_today)
{
   &do_datetime_lsorbian(@_);
}

sub do_datetime_magyar{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datemagyar{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR.";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datemagyar(@_);
}

if (defined &magyar_today)
{
   &do_datetime_magyar(@_);
}

sub do_datetime_naustrian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datenaustrian{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datenaustrian(@_);
}

if (defined &naustrian_today)
{
   &do_datetime_naustrian(@_);
}

sub do_datetime_ngerman{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datengerman{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datengerman(@_);
}

if (defined &ngerman_today)
{
   &do_datetime_ngerman(@_);
}

sub do_datetime_norsk{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datenorsk{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datenorsk(@_);
}

if (defined &norsk_today)
{
   &do_datetime_norsk(@_);
}

sub do_datetime_polish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datenorsk{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datenorsk(@_);
}

if (defined &polish_today)
{
   &do_datetime_polish(@_);
}

sub do_datetime_portuges{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateportuges{';
   $tmp .= '  $dateformat = "THEDAY de MONTHNAME[THEMONTH] de THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateportuges(@_);
}

if (defined &portuges_today)
{
   &do_datetime_portuges(@_);
}

sub do_datetime_romanian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateromanian{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateromanian(@_);
}

if (defined &romanian_today)
{
   &do_datetime_romanian(@_);
}

sub do_datetime_russian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_daterussian{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR \\\\cyrg.";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_daterussian(@_);
}

if (defined &russian_today)
{
   &do_datetime_russian(@_);
}

sub do_datetime_samin{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datesamin{';
   $tmp .= '  $dateformat = "MONTHNAME[THEMONTH] THEDAY.~b. THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datesamin(@_);
}

if (defined &samin_today)
{
   &do_datetime_samin(@_);
}

sub do_datetime_scottish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datescottish{';
   $tmp .= '  $dateformat = "THEDAY MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datescottish(@_);
}

if (defined &scottish_today)
{
   &do_datetime_scottish(@_);
}

sub do_datetime_serbian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateserbian{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateserbian(@_);
}

if (defined &serbian_today)
{
   &do_datetime_serbian(@_);
}

sub do_datetime_slovak{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateslovak{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateslovak(@_);
}

if (defined &slovak_today)
{
   &do_datetime_slovak(@_);
}

sub do_datetime_slovene{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateslovene{';
   $tmp .= '  $dateformat = "THEDAY. MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateslovene(@_);
}

if (defined &slovene_today)
{
   &do_datetime_slovene(@_);
}

sub do_datetime_spanish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datespanish{';
   $tmp .= '  $dateformat = "THEDAY~de MONTHNAME[THEMONTH] de~THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datespanish(@_);
}

if (defined &spanish_today)
{
   &do_datetime_spanish(@_);
}

sub do_datetime_swedish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateswedish{';
   $tmp .= '  $dateformat = "THEDAY~MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   $tmp = "";
   $tmp .= 'sub do_cmd_datesymd{';
   $tmp .= '  $dateformat = "THEYEAR-TWODIGIT{THEMONTH}-TWODIGIT{THEDAY}";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   $tmp = "";
   $tmp .= 'sub do_cmd_datesdmy{';
   $tmp .= '  $dateformat = "THEDAY/THEMONTH THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateswedish(@_);
}

if (defined &swedish_today)
{
   &do_datetime_swedish(@_);
}

sub do_datetime_turkish{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateturkish{';
   $tmp .= '  $dateformat = "THEDAY~MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateturkish(@_);
}

if (defined &turkish_today)
{
   &do_datetime_turkish(@_);
}

sub do_datetime_ukraineb{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateukraineb{';
   $tmp .= '  $dateformat = "THEDAY~MONTHNAME[THEMONTH] THEYEAR~\\\\cyrr.";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateukraineb(@_);
}

if (defined &ukraineb_today)
{
   &do_datetime_ukraineb(@_);
}

sub do_datetime_usorbian{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_dateusorbian{';
   $tmp .= '  $dateformat = "THEDAY.~MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_dateusorbian(@_);
}

if (defined &usorbian_today)
{
   &do_datetime_usorbian(@_);
}

sub do_datetime_welsh{
   local($tmp) = "";

   $tmp .= 'sub do_cmd_datewelsh{';
   $tmp .= '  $dateformat = "{ORDINALDATE{DAY}}\\ a viz MONTHNAME[THEMONTH] THEYEAR";';
   $tmp .= '   $_[0];';
   $tmp .= '}';

   eval($tmp);

   $tmp = 'sub do_cmd_ordinaldate{';
   $tmp .= 'local($_) = @_;';
   $tmp .= 'local($num) = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($num=$2));';
   $tmp .= 'local($before) = $num;';

   $tmp .= 'if ($num == 1)';
   $tmp .= '{ $before .= \'a\~n\'; }';

   $tmp .= '$before . $_[0];';
   $tmp .= '}';

   eval($tmp);

   &do_cmd_datewelsh(@_);
}

if (defined &welsh_today)
{
   &do_datetime_welsh(@_);
}

# As far as I know, LaTeX2HTML doesn't implement TeX conditionals.
# $showdow corresponds to LaTeX boolean variable showdow
$showdow = 1;

sub get_monthname{
   local($month) = @_;

   if ($month eq 'THEMONTH' or $month eq '\THEMONTH')
   {
      # this is a cludge to help newdateformat work

      'MONTHNAME[THEMONTH]';
   }
   else
   {
      if ($month eq '')
      {
         local($today) = &get_date();
         $today =~ m|(\d+)/0?(\d+)/|;
         $month = $1;
      }

      $Month[$month];
   }
}

sub do_cmd_monthname{
   local($_) = @_;
   local($month,$pat) = &get_next_optional_argument;

   local($monthname) = &get_monthname($month);
   join('',$monthname,$_);
}

sub get_shortmonthname{
   local($month) = @_;

   if ($month eq 'THEMONTH' or $month eq '\THEMONTH')
   {
      'SHORTMONTHNAME[THEMONTH]';
   }
   else
   {
      substr(&get_monthname($month), 0, 3);
   }
}

sub do_cmd_shortmonthname{
   local($_) = @_;
   local($month,$pat) = &get_next_optional_argument;

   local($monthname) = &get_shortmonthname($month);

   join('',$monthname,$_);
}

sub is_leap_year{
   local($year) = @_;
   local($isleapyear) = 0;

   if (($year%400) == 0)
   {
      # year mod 400 = 0 => leap year

      $isleapyear = 1;
   }
   elsif (($year%100) == 0)
   {
      # year mod 100 = 0 and year mod 400 != 0 => not a leap year

      $isleapyear = 0;
   }
   elsif (($year%4) == 0)
   {
      # year mod 4 = 0 and year mod 100 != 0 => leap year

      $isleapyear = 1;
   }

   $isleapyear;
}

sub get_day_of_year{
   local($day,$month,$year) = @_;
   local($dayofyear) = 0;

   SWITCH: {
      if ($month == 2) {$dayofyear += 31; last SWITCH; }
      if ($month == 3) {$dayofyear += 59; last SWITCH; }
      if ($month == 4) {$dayofyear += 90; last SWITCH; }
      if ($month == 5) {$dayofyear += 120; last SWITCH; }
      if ($month == 6) {$dayofyear += 151; last SWITCH; }
      if ($month == 7) {$dayofyear += 181; last SWITCH; }
      if ($month == 8) {$dayofyear += 212; last SWITCH; }
      if ($month == 9) {$dayofyear += 243; last SWITCH; }
      if ($month == 10) {$dayofyear += 273; last SWITCH; }
      if ($month == 11) {$dayofyear += 304; last SWITCH; }
      if ($month == 12) {$dayofyear += 334; last SWITCH; }
   }

   if ($month > 2 && &is_leap_year($year))
   {
      $dayofyear += 1;
   }

   $dayofyear += $day;
   local($_)=$dayofyear;
}

sub get_day_of_week{
   local($day,$month,$year) = @_;
   local($dayofyear) = &get_day_of_year($day,$month,$year);
   local($_) = (((($year-1901)%28)*1.25 + 2)%7 + $dayofyear - 1)%7 + 1;
}

sub get_day_of_weekname_english{
   local($dow) = @_;

   local(@DayOfWeek) = ('Sunday',
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday');

   if ($dow <= 0 || $dow > 7)
   {
      &write_warnings("Invalid day of week number: $dow");
   }
   else
   {
      $DayOfWeek[$dow-1];
   }
}

sub get_day_of_weekname_french{
   local($dow) = @_;

   local(@DayOfWeek) = ('dimanche',
                        'lundi',
                        'mardi',
                        'mercredi',
                        'jeudi',
                        'vendredi',
                        'samedi');

   if ($dow <= 0 || $dow > 7)
   {
      &write_warnings("Invalid day of week number: $dow");
   }
   else
   {
      $DayOfWeek[$dow-1];
   }
}

sub get_day_of_weekname_spanish{
   local($dow) = @_;

   local(@DayOfWeek) = ('domingo',
                        'lunes',
                        'martes',
                        'mi\\\'ercoles',
                        'jueves',
                        'viernes',
                        's\\\'abado');

   if ($dow <= 0 || $dow > 7)
   {
      &write_warnings("Invalid day of week number: $dow");
   }
   else
   {
      $DayOfWeek[$dow-1];
   }
}

sub get_day_of_weekname_portuges{
   local($dow) = @_;

   local(@DayOfWeek) = ('domingo',
                        'segunda-feira',
                        'ter\c{c}a-feira',
                        'quarta-feira',
                        'quinta-feira',
                        'sexta-feira',
                        'sabado');

   if ($dow <= 0 || $dow > 7)
   {
      &write_warnings("Invalid day of week number: $dow");
   }
   else
   {
      $DayOfWeek[$dow-1];
   }
}

sub get_day_of_weekname{
   local($dow)=@_;
   local($dowsub);

   $dowsub = "get_day_of_weekname_$default_language";

   if (defined ($dowsub))
   {
      &$dowsub($dow);
   }
   else
   {
      &get_day_of_weekname_english($dow);
   }
}

sub get_short_day_of_weekname{
   local($dow)=@_;

   substr(&get_day_of_weekname($dow),0,3);
}

sub do_cmd_dayofweeknameid{
   local($_) = @_;
   local($dow);

   $dow = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($dow=$2));

   join('',&get_day_of_weekname($dow), $_);
}

sub do_cmd_dayofweekname{
   local($_) = @_;
   local($day,$month,$year);
   # read 1st argument
   $day = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($day=$2));
   # read 2nd argument
   $month = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($month=$2));
   # read 3rd argument
   $year = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($year=$2));

   if ($day eq 'THEDAY' or $day eq '\THEDAY')
   {
      # this is a cludge to help newdateformat work

      join('', '{DOW}', $_);
   }
   else
   {
      local($dow) = &get_day_of_week($day,$month,$year);

      join('',&get_day_of_weekname($dow), $_);
   }
}

sub do_cmd_shortdayofweekname{
   local($_) = @_;
   local($day,$month,$year);
   # read 1st argument
   $day = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($day=$2));
   # read 2nd argument
   $month = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($month=$2));
   # read 3rd argument
   $year = &missing_braces unless ((s/$next_pair_pr_rx//o)&&($year=$2));

   local($dow) = &get_day_of_week($day,$month,$year);

   join('',&get_short_day_of_weekname($dow), $_);
}

sub do_cmd_thisdayofweekname{
   local($dow) = &get_day_of_week($global{DAY}, $global{MONTH}, $global{YEAR});

   join('',$DayOfWeek[$dow], $_);
}

sub do_cmd_thisshortdayofweekname{
   local($dow) = &get_day_of_week($global{DAY}, $global{MONTH}, $global{YEAR});

   join('',&get_short_day_of_weekname($dow), $_);
}

$dateformat = "\\ifshowdow{DOW}\\fi {ORDINALDATE{DAY}}\\ MONTHNAME[THEMONTH], THEYEAR";

sub format_date{
   local($day,$month,$year) = @_;

   local($str) = $dateformat;

   $str =~ s/THEDAY/$day/g;
   $str =~ s/THEMONTH/$month/g;
   $str =~ s/THEYEAR/$year/g;

   $str =~ s/TWODIGIT{([\d]+)}/&get_twodigit($1)/eg;
   $str =~ s/ROMANNUMERAL{([\d]+)}/&froman($1)/eg;
   $str =~ s/ROMANNUMERALU{([\d]+)}/uc(&froman($1))/eg;
   $str =~ s/TRUNCATE{([\d]+)}/&get_twodigit($1%100)/eg;
   $str =~ s/SHORTMONTHNAME\[([\d]+)\]/&get_shortmonthname($1)/eg;
   $str =~ s/MONTHNAME\[([\d]+)\]/&get_monthname($1)/eg;

   local($X) = ++$global{'max_id'};
   local($Y) = ++$global{'max_id'};
   local($Z) = ++$global{'max_id'};
   $str =~ s/{DOW}/\\dayofweekname${OP}$X${CP}$day${OP}$X${CP}${OP}$Y${CP}$month${OP}$Y${CP}${OP}$Z${CP}$year${OP}$Z${CP}/g;
   $str =~ s/{SDOW}/\\shortdayofweekname${OP}$X${CP}$day${OP}$X${CP}${OP}$Y${CP}$month${OP}$Y${CP}${OP}$Z${CP}$year${OP}$Z${CP}/g;

   local($br_id) = ++$global{'max_id'};
   $suffix = &get_ordinal_suffix($day);
   $str =~ s/{ORDINAL{DAY}}/$day\\fmtord${OP}$br_id${CP}$suffix${OP}$br_id${CP}/g;

   $br_id = ++$global{'max_id'};
   $suffix = &get_ordinal_suffix($month);
   $str =~ s/{ORDINAL{MONTH}}/$month\\fmtord${OP}$br_id${CP}$suffix${OP}$br_id${CP}/g;

   $br_id = ++$global{'max_id'};
   $suffix = &get_ordinal_suffix($year);
   $str =~ s/{ORDINAL{YEAR}}/$year\\fmtord${OP}$br_id${CP}$suffix${OP}$br_id${CP}/g;

   local($br_id) = ++$global{'max_id'};
   $str =~ s/{ORDINALDATE{DAY}}/\\ordinaldate${OP}$br_id${CP}$day${OP}$br_id${CP}/g;

   $str =~ s/{NUMBERSTRING{DAY}}/&get_numberstring($day)/eg;
   $str =~ s/{NUMBERSTRING{MONTH}}/&get_numberstring($month)/eg;
   $str =~ s/{NUMBERSTRING{YEAR}}/&get_numberstring($year)/eg;

   $str =~ s/{ORDINALSTRING{DAY}}/&get_ordinalstring($day)/eg;
   $str =~ s/{ORDINALSTRING{MONTH}}/&get_ordinalstring($month)/eg;
   $str =~ s/{ORDINALSTRING{YEAR}}/&get_ordinalstring($year)/eg;

   $str =~ s/{NNUMBERSTRING{DAY}}/&get_Numberstring($day)/eg;
   $str =~ s/{NNUMBERSTRING{MONTH}}/&get_Numberstring($month)/eg;
   $str =~ s/{NNUMBERSTRING{YEAR}}/&get_Numberstring($year)/eg;

   $str =~ s/{OORDINALSTRING{DAY}}/&get_Ordinalstring($day)/eg;
   $str =~ s/{OORDINALSTRING{MONTH}}/&get_Ordinalstring($month)/eg;
   $str =~ s/{OORDINALSTRING{YEAR}}/&get_Ordinalstring($year)/eg;

   $str;
}

sub do_cmd_formatdate{
   local($day,$month,$year);
   # read 1st argument
   $day = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($day=$2));
   # read 2nd argument
   $month = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($month=$2));
   # read 3rd argument
   $year = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($year=$2));

   join('', &format_date($day,$month,$year), $_[0]);
}

sub do_cmd_today{
   join('', &format_date($global{DAY},$global{MONTH},$global{YEAR}), $_[0]);
}

sub do_cmd_day{
   join('', $global{DAY}, $_[0]);
}

sub do_cmd_month{
   join('', $global{MONTH}, $_[0]);
}

sub do_cmd_year{
   join('', $global{YEAR}, $_[0]);
}

sub do_cmd_showdowtrue{
   local($_) = @_;
   $showdow = 1;
   $_[0];
}

sub do_cmd_showdowfalse{
   local($_) = @_;
   $showdow = 0;
   $_[0];
}

# This is a bit primative, it doesn't allow for
# nested conditionals

sub do_cmd_ifshowdow{
   local($_) = @_;
   local($ifbit,$elsebit);

   $_[0] =~s/(.*)\\fi//;

   $ifbit = $1;

   $ifbit =~s/(.*)\\else(.*)/\1/g;

   $elsebit = $2;

   if ($showdow)
   {
      join('', $ifbit, $_[0]);
   }
   else
   {
      join('', $elsebit, $_[0]);
   }
}

sub do_cmd_dateseparator{
   join('', '/', $_[0]);
}

sub do_cmd_longdate{
   $dateformat = "\\ifshowdow{DOW}\\fi {ORDINALDATE{DAY}}\\ MONTHNAME[THEMONTH], THEYEAR";

   $_[0];
}

sub do_cmd_shortdate{
   $dateformat = "\\ifshowdow{SDOW}\\fi {ORDINALDATE{DAY}}\\ SHORTMONTHNAME[THEMONTH], THEYEAR";

   $_[0];
}

sub do_cmd_ddmmyyyydate{
   $dateformat = "TWODIGIT{THEDAY}\\dateseparator TWODIGIT{THEMONTH}\\dateseparator THEYEAR";

   $_[0];
}

sub do_cmd_dmyyyydate{
   $dateformat = "THEDAY\\dateseparator THEMONTH\\dateseparator THEYEAR";

   $_[0];
}

sub do_cmd_dmyydate{
   $dateformat = "THEDAY\\dateseparator THEMONTH\\dateseparator TRUNCATE{THEYEAR}";

   $_[0];
}

sub do_cmd_ddmmyydate{
   $dateformat = "TWODIGIT{THEDAY}\\dateseparator TWODIGIT{THEMONTH}\\dateseparator TRUNCATE{THEYEAR}";

   $_[0];
}

sub do_cmd_textdate{
   $dateformat = "\\ifshowdow{DOW} the\\fi {OORDINALSTRING{DAY}} of MONTHNAME[THEMONTH], {NNUMBERSTRING{YEAR}}";

   $_[0];
}

sub do_cmd_usdate{
   $dateformat = "MONTHNAME[THEMONTH] THEDAY, THEYEAR";

   $_[0];
}

sub do_cmd_mmddyyyydate{
   $dateformat = "TWODIGIT{THEMONTH}\\dateseparator TWODIGIT{THEDAY}\\dateseparator THEYEAR";

   $_[0];
}

sub do_cmd_mdyyyydate{
   $dateformat = "THEMONTH\\dateseparator THEDAY\\dateseparator THEYEAR";

   $_[0];
}

sub do_cmd_mmddyydate{
   $dateformat = "TWODIGIT{THEMONTH}\\dateseparator TWODIGIT{THEDAY}\\dateseparator TRUNCATE{THEYEAR}";

   $_[0];
}

sub do_cmd_mdyydate{
   $dateformat = "THEMONTH\\dateseparator THEDAY\\dateseparator TRUNCATE{THEYEAR}";

   $_[0];
}

sub do_cmd_THEYEAR{
   join('', 'THEYEAR', $_[0]);
}

sub do_cmd_THEMONTH{
   join('', 'THEMONTH', $_[0]);
}

sub do_cmd_THEDAY{
   join('', 'THEDAY', $_[0]);
}

sub do_cmd_newdateformat{
   local($_) = @_;
   local($cmd,$cmdbody);
   local($ntmp);

   $cmd = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($cmd=$2));
   $cmdbody = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($cmdbody=$2));

   $ntmp = 'sub do_cmd_' . $cmd . '{';
   $ntmp .= '$dateformat = "' . $cmdbody . '";';

   $ntmp .= '$_[0];';
   $ntmp .= '}';

   eval($ntmp);

   join('', $_[0]);
}

sub do_cmd_pdfdate{
   local($_) = @_;

   local($timestring) = sprintf "%d%02d%02d%02d%02d%02d",
                        $global{YEAR}, $global{MONTH}, $global{DAY}, $global{HOUR}, $global{MINUTE}, $global{SECONDS};

   join('', $timestring, $_[0]);
}

 %userdates = ();

sub do_cmd_newdate{
   local($_)=@_;
   local($datename,$mon,$day,$year);

   $datename = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($datename=$2));

   $day = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($day=$2));

   $mon = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($mon =$2));

   $year = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($year =$2));

   $userdates{$datename}{day} = $day;
   $userdates{$datename}{month} = $mon;
   $userdates{$datename}{year} = $year;

   join('', $_[0]);
}

sub do_cmd_displaydate{
   local($_)=@_;
   local($datename);
   local($cmd,$br_id);

   $datename = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($datename=$2));

   $br_id = ++$global{'max_id'};
   $cmd = "$OP$br_id$CP" . $userdates{$datename}{day} ."$OP$br_id$CP";
   $br_id = ++$global{'max_id'};
   $cmd .= "$OP$br_id$CP" . $userdates{$datename}{month} ."$OP$br_id$CP";
   $br_id = ++$global{'max_id'};
   $cmd .= "$OP$br_id$CP" . $userdates{$datename}{year} ."$OP$br_id$CP";

   join('', '\formatdate', $cmd,  $_[0]);
}

sub do_cmd_getdateyear{
   local($_)=@_;
   local($datename);

   $datename = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($datename=$2));

   join('', $userdates{$datename}{year}, $_[0]);
}

sub do_cmd_getdatemonth{
   local($_)=@_;
   local($datename);

   $datename = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($datename=$2));

   join('', $userdates{$datename}{month}, $_[0]);
}

sub do_cmd_getdateday{
   local($_)=@_;
   local($datename);

   $datename = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($datename=$2));

   join('', $userdates{$datename}{day}, $_[0]);
}

# time commands

sub do_cmd_timeseparator{
   join('', ':', $_[0]);
}

sub do_cmd_xxivtime{
   local($_) = @_;

   local($timestring) = sprintf "%02d\\timeseparator %02d", $global{HOUR}, $global{MINUTE};

   join('', $timestring, $_[0]);
}

sub do_cmd_noon{
   local($_) = @_;

   join('', "Noon", $_[0]);
}

sub do_cmd_midnight{
   local($_) = @_;

   join('', "Midnight", $_[0]);
}

sub do_cmd_amname{
   local($_) = @_;

   join('', "am", $_[0]);
}

sub do_cmd_pmname{
   local($_) = @_;

   join('', "pm", $_[0]);
}

sub do_cmd_amstring{
   local($_) = @_;

   join('', "in the morning", $_[0]);
}

sub do_cmd_pmstring{
   local($_) = @_;

   join('', "in the afternoon", $_[0]);
}

sub do_cmd_halfpast{
   local($_) = @_;

   join('', "Half past", $_[0]);
}

sub do_cmd_quarterpast{
   local($_) = @_;

   join('', "Quarter past", $_[0]);
}

sub do_cmd_quarterto{
   local($_) = @_;

   join('', "Quarter to", $_[0]);
}

sub do_cmd_oclockstring{
   local($_) = @_;

   join('', "O'Clock", $_[0]);
}

sub do_cmd_amorpmname{
   if ($global{HOUR}>12)
   {
      &do_cmd_pmname;
   }
   else
   {
      &do_cmd_amname;
   }
}

sub do_cmd_amorpmstring{
   if ($global{HOUR}>12)
   {
      &do_cmd_pmstring;
   }
   else
   {
      &do_cmd_amstring;
   }
}

sub do_cmd_ampmtime{
   local($_) = @_;
   local($timestring);

   $timestring = sprintf "%d\\timeseparator %02d\\amorpmname", $global{HOUR}, $global{MINUTE};

   join('', $timestring, $_[0]);
}

sub do_cmd_oclock{
   local($_) = @_;
   local($timestring);

   if ($global{HOUR} == 0 && $global{MINUTE} == 0)
   {
      $timestring = "\\midnight";
   }
   elsif ($global{HOUR} == 12 && $global{MINUTE} == 0)
   {
      $timestring = "\\noon";
   }
   else
   {
      if ($global{MINUTE} == 0)
      {
         $timestring = &get_Numberstring($global{HOURXII}) . " \\oclockstring";
      }
      elsif ($global{MINUTE} == 15)
      {
         $timestring = "\\quarterpast\\ " .  &get_Numberstring($global{HOURXII});
      }
      elsif ($global{MINUTE} == 30)
      {
         $timestring = "\\halfpast\\ " .  &get_Numberstring($global{HOURXII});
      }
      elsif ($global{MINUTE} == 45)
      {
         $timestring = "\\quarterto\\ " .  &get_Numberstring($global{TOHOUR});
      }
      elsif ($global{MINUTE} < 30)
      {
         $timestring = get_Numberstring($global{MINUTE});

         $timestring .= ($global{MINUTE} == 1 ? " minute" : " minutes") . " past ";

         $timestring .= get_Numberstring($global{HOURXII});
      }
      else
      {
         $timestring = get_Numberstring($global{TOMINUTE});

         $timestring .= ($global{MINUTE} == 1 ? " minute" : " minutes") . " to ";

         $timestring .= get_Numberstring($global{TOHOUR});
      }

      $timestring .= ($global{HOUR} < 12 ? " \\amstring" : " \\pmstring");
   }

   join('', $timestring, $_[0]);
}

sub do_cmd_currenttime{
   local($_) = @_;

   join('', "\\xxivtime", $_[0]);
}

sub do_cmd_settimeformat{
   local($_) = @_;
   local($cmd);

   $cmd = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($cmd=$2));

   #$tmp = 'sub do_cmd_currenttime{local($_) = @_; join(\'\', "\\\\' . $cmd . '", $_[0]); }';

   $tmp = 'sub do_cmd_currenttime{&do_cmd_' . $cmd . '(@_);}';

   eval($tmp);

   join('', $_[0]);
}

sub do_cmd_newtimeformat{
   local($_) = @_;
   local($cmd,$cmdbody);

   $cmd = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($cmd=$2));
   $cmdbody = &missing_braces unless ($_[0]=~(s/$next_pair_pr_rx//o)&&($cmdbody=$2));

   $tmp = 'sub do_cmd_' . $cmd . '{' . "\n";

   $tmp .= 'local($_) = @_;'. "\n";

   $tmp .= 'join(\'\',"' . $cmdbody. '", $_[0]); }';

   eval($tmp);

   join('', $_[0]);
}

sub do_cmd_THEHOUR{
   local($_) = @_;

   join('', $global{HOUR}, $_[0]);
}

sub do_cmd_THEMINUTE{
   local($_) = @_;

   join('', $global{MINUTE}, $_[0]);
}

sub do_cmd_THETOHOUR{
   local($_) = @_;

   join('', $global{TOHOUR}, $_[0]);
}

sub do_cmd_THETOMINUTE{
   local($_) = @_;

   join('', $global{TOMINUTE}, $_[0]);
}

sub do_cmd_THEHOURXII{
   local($_) = @_;

   join('', $global{HOURXII}, $_[0]);
}

1;
