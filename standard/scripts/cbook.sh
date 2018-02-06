#!/bin/bash

pdflatex main
makeindex main.idx -s StyleInd.ist
biber main
pdflatex main x 2
