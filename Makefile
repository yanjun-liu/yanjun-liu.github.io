PELICAN=pelican
PELICANOPTS=

BASEDIR=$(PWD)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

SSH_HOST=bounce
SSH_PORT=22
SSH_USER=tbunnyman
SSH_TARGET_DIR=/srv/vegasfur/www/

help:
	@echo 'Makefile for a pelican Web site                                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html                        (re)generate the web site          '
	@echo '   make clean                       remove the generated files         '
	@echo '   make publish                     generate using production settings '
	@echo '   ssh                              upload the web site via SSH        '
	@echo '   rsync                            upload the web site via rsync/ssh  '
	@echo '                                                                       '


html: clean $(OUTPUTDIR)/index.html
	@echo 'Done'

$(OUTPUTDIR)/%.html:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)
	cp $(BASEDIR)/extras/* $(OUTPUTDIR)/

clean:
	find $(OUTPUTDIR) -mindepth 1 -delete

regenerate: clean
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
	./develop_server.sh restart

publish:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)
	cp $(BASEDIR)/extras/* $(OUTPUTDIR)/

ssh: publish
	scp -P $(SSH_PORT) -r $(OUTPUTDIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

rsync: publish
	rsync -e "ssh -p $(SSH_PORT)" -P -rvz --delete $(OUTPUTDIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

.PHONY: html help clean regenerate serve publish ssh rsync 

