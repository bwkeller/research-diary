#!/bin/sh


TEXFILE=`ls *.tex | tail -n 1`
PSFILE=`basename $TEXFILE .tex`.ps
DVIFILE=`basename $TEXFILE .tex`.dvi
PDFFILE=`basename $TEXFILE .tex`.pdf

echo "Compiling $TEXFILE."

latex -interaction=batchmode -halt-on-error $TEXFILE 
dvips -q -o "$PSFILE" "$DVIFILE" -R0
ps2pdf "$PSFILE" "$PDFFILE"

rm -f *.out *.dvi *.ps *.tex.backup *~ *.aux *.log

evince $PDFFILE &
