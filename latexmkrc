$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -file-line-error %O %S';
$ENV{'BIBINPUTS'} = '.;..;' . ($ENV{'BIBINPUTS'} || '');
$ENV{'BSTINPUTS'} = '.;' . ($ENV{'BSTINPUTS'} || '');
$bibtex_use = 2;
