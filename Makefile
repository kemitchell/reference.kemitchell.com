SITE=site
MARKDOWN=node_modules/.bin/commonmark
PAGES=pages
SOURCES=$(wildcard $(PAGES)/*.md)
BASENAMES=$(notdir $(SOURCES))
TITLES=$(addprefix $(PAGES)/,$(BASENAMES:.md=.title))

all: $(addprefix $(SITE)/,$(BASENAMES:.md=.html)) $(SITE)/styles.css $(SITE)/index.html

.INTERMEDIATE: $(PAGES)/index.md

$(PAGES)/index.md: $(TITLES)
	echo '---\ntitle: Reference Pages\n---' > $@
	for title in $(TITLES); do echo "- [$$(cat $$title)](./$$(basename $$title .title).html)" >> $@ ; done

$(PAGES)/%.title: $(PAGES)/%.md.meta
	fgrep 'title: ' $(PAGES)/$*.md.meta | sed 's/title: //' > $@

$(SITE)/%.html: top.html bottom.html $(PAGES)/%.md.meta $(PAGES)/%.md.content | $(MARKDOWN) $(SITE)
	sed "s/TITLE/$(shell fgrep 'title: ' $(PAGES)/$*.md.meta | sed 's/title: //')/" top.html > $@
	$(MARKDOWN) $(PAGES)/$*.md.content >> $@
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
