# creatdtx.perl LaTeX2HTML file corresponding to creatdtx.sty package
# author : Nicola Talbot
# date   : 8th Feb 2005

package main;

print " [creatdtx v0.9b (N.L.C. Talbot)]";

sub do_cmd_meta
{
   &do_cmd_emph(@_);
}

&ignore_commands( <<_IGNORED_CMDS_);
ifmakedtx # {}
StopEventually # {}
OnlyDescription
RecordChanges
PrintChanges
EnableCrossRefs
CodelineIndex
GetFileInfo # {}
CheckSum # {}
DescribeMacro # {}
DescribeEnvironment # {}
MakeShortVerb # {}
DeleteShortVerb # {}
DoNotIndex # {}
changes # {} # {} # {}
_IGNORED_CMDS_

1;
