#!/usr/bin/perl

# Usage: latexmk -pvc

# If Japanese
$latex         = 'uplatex %O -src-specials -shell-escape -interaction=nonstopmode -synctex=1 -kanji=utf8 %S; sed -n -e "/^\!.*\$/,\$p" %B.log > %B-trunc.log';
$bibtex        = 'pbibtex %O %B -kanji=utf8';
$dvipdf        = 'dvipdfmx %O -o %D %S';
$pdf_mode      = 3; # use dvipdfmx

# If English
#$pdflatex      = 'pdflatex -src-specials -shell-escape -interaction=nonstopmode -synctex=1 %O %S; sed -n -e "/^\!.*\$/,\$p" %B.log > %B-trunc.log';
#$bibtex        = 'bibtex %O %B';
#$pdf_mode      = 1; # use pdflatex

# Use SumatraPDF and atom inverse search
# please replace maruta by your username
# $pdf_previewer = '"C:\Program Files\SumatraPDF\SumatraPDF.exe" -reuse-instance -inverse-search "\"C:\Users\maruta\AppData\Local\atom\bin\atom.cmd\" \"%f:%l\"" %O %S';

# if you do not need to preview in -pvc option (preview document and countinuously update mode)
$pdf_previewer = 'exit';
