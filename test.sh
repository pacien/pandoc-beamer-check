#!/bin/zsh

themes=(
  'default'

  'AnnArbor'
  'Antibes'
  'Bergen'
  'Berkeley'
  'Berlin'
  'Boadilla'
  'boxes'
  'CambridgeUS'
  'Copenhagen'
  'Darmstadt'
  'Dresden'
  'Frankfurt'
  'Goettingen'
  'Hannover'
  'Ilmenau'
  'JuanLesPins'
  'Luebeck'
  'Madrid'
  'Malmoe'
  'Marburg'
  'Montpellier'
  'PaloAlto'
  'Pittsburgh'
  'Rochester'
  'Singapore'
  'Szeged'
  'Warsaw'

  'metropolis'
)

outdir=./out

for theme in $themes; do
  pandoc -t beamer -V theme:$theme slides.md -o $outdir/$theme.old.pdf
  pandoc -t beamer -V theme:$theme --template new.latex slides.md -o $outdir/$theme.new.pdf
  ./diff-pdf --output-diff=$outdir/$theme.diff.pdf $outdir/$theme.old.pdf $outdir/$theme.new.pdf

  if [ $? -eq 0 ]; then
    echo "no difference for theme $theme"
  else
    echo "difference spotted for theme $theme"
  fi
done

