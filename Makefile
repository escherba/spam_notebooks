.PHONY: clean env virtualenv

PYENV = . env/bin/activate;
PYTHON = $(PYENV) python

NOTEBOOK_DIR = src
PDF_DIR = pdfs
SOURCES := $(shell ls $(NOTEBOOK_DIR)/*.ipynb)
PDFS := $(patsubst $(NOTEBOOK_DIR)/%,$(PDF_DIR)/%,$(SOURCES:.ipynb=.pdf))

server:
	$(PYENV) ipython notebook

clean:
	find . -path ./env -prune -o -type f -name "*.pyc" -exec rm {} \;

.IGNORE:$(PDFS)
pdfs: $(PDFS)
	@echo "all done"

pdfs/%.pdf: src/%.ipynb
	ipython nbconvert --to pdf $< --output $(@:.pdf=)

# note: to have working LaTeX installation on Mac, it is sufficient to
# download BasicTeX:
# http://www.tug.org/mactex/morepackages.html
#
# On Mavericks you will also need to:
# ln -s /Library/TeX/Distributions/Programs/texbin /usr/texbin
#
# Don't forget to add /usr/texbin to your path to make PDF exporting work
install_latex_deps:
	tlmgr install adjustbox
	tlmgr install collectbox
	tlmgr install ucs

env virtualenv: env/bin/activate
env/bin/activate: requirements.txt
	test -f $@ || virtualenv --no-site-packages env
	$(PYENV) pip install -U pip wheel
	$(PYENV) STATIC_DEPS=true CFLAGS=-I/usr/local/include/lzma pip install -U lxml
	$(PYENV) pip install -r $<
	touch $@
