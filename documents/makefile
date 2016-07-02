# Variables you can change
#Preview script
preview=./refresh.sh

#Source file WITHOUT the extension
src=source

#Source files extension
ext=md

#Source type
from=markdown

#Output type
to=html5

#Additional args
ARGS=--mathml
# -V revealjs-url=../reveal.js

html: $(src).$(ext)
	pandoc -s -S -f $(from) $(src).$(ext) -t $(to) -o .$(src).html $(ARGS)
	$(preview) .$(src).html

pdf: $(src).$(ext)
	pandoc -s -S -f $(from) $(src).$(ext) -t $(to) -o .$(src).pdf $(ARGS)
	$(preview) .$(src).pdf

export: $(src).$(ext)
	pandoc -s -S -f $(from) $(src).$(ext) -t $(to) -o $(src).html $(ARGS) --self-contained

export-pdf: $(src).$(ext)
	pandoc -s -S -f $(from) $(src).$(ext) -t $(to) -o $(src).pdf $(ARGS) --self-contained
