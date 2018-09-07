SITE=site
MARKDOWN=node_modules/.bin/commonmark
SOURCES=$(wildcard *.md)

all: $(addprefix $(SITE)/,$(SOURCES:.md=.html)) $(SITE)/styles.css

$(SITE)/%.html: top.html bottom.html %.md.meta %.md.content | $(MARKDOWN) $(SITE)
	sed "s/TITLE/$(shell fgrep 'title: ' $*.md.meta | sed 's/title: //')/" top.html > $@
	$(MARKDOWN) $*.md.content >> $@
	sed "s/BASENAME/$*/" bottom.html >> $@

%.md.content: %.md
	csplit --elide-empty-files --suppress-matched --silent $< /---/ '{*}'
	mv xx01 $@
	rm -f xx*

%.md.meta: %.md
	csplit --elide-empty-files --suppress-matched --silent $< /---/ '{*}'
	mv xx00 $@
	rm -f xx*

$(SITE)/styles.css: styles.css | $(SITE)
	cp $< $@

$(SITE):
	mkdir -p $(SITE)

$(MARKDOWN):
	 npm install

.PHONY: clean

clean:
	rm -rf $(SITE)
