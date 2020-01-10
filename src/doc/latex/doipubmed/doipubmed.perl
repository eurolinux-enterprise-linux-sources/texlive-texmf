#!/usr/bin/perl

# File        : doipub.perl
# Author      : Nicola Talbot
# Date        : 9th September 2005
# Description : LaTeX2HTML style file implementing doipubmed package

sub do_cmd_doitext{
   local($_) = @_;
   local($doi);

   s/$next_pair_pr_rx/$doi=$2;''/eo;
   join('', "doi", $_);
}

sub do_cmd_pubmedtext{
   local($_) = @_;
   local($pubmed);

   s/$next_pair_pr_rx/$pubmed=$2;''/eo;
   join('', "PubMed", $_);
}

sub do_cmd_doi{
   local($_) = @_;
   local($doi,$doitext,$br_id);

   s/$next_pair_pr_rx/$br_id=$1;$doi=$2;''/eo;

   $doitext = &do_cmd_doitext("$OP$br_id$CP$doi$OP$br_id$CP");

   join('',
        &make_href("http://dx.doi.org/$doi", $doitext),
        $_);
}

sub do_cmd_pubmed{
   local($_) = @_;
   local($pubmed,$pubmedtext,$br_id);

   s/$next_pair_pr_rx/$br_id=$1;$pubmed=$2;''/eo;

   $pubmedtext = &do_cmd_pubmedtext("$OP$br_id$CP$pubmed$OP$br_id$CP");

   join('',
        &make_href("http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=$pubmed&dopt=Abstract",
                   $pubmedtext),
        $_);
}

sub do_cmd_citeurl{
   local($_) = @_;
   local($url);

   s/$next_pair_pr_rx/$url=$2;''/eo;

   join('', '&lt;',
        &make_href($url, $url), '&gt;',
        $_);
}

1;
