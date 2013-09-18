#latex $1.tex
#dvips -t unknown $1.dvi
#ps2pdf $1.ps
pdflatex --shell-escape $1.tex
pdfcrop $1.pdf
convert -verbose -delay 6 -loop 0 -density 80 $1-crop.pdf $1.gif
rm $1.log
rm $1.aux