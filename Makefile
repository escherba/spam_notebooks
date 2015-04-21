.PHONY: clean env virtualenv

PYENV = . env/bin/activate;
PYTHON = $(PYENV) python

server:
	$(PYENV) ipython notebook

clean:
	find . -path ./env -prune -o -type f -name "*.pyc" -exec rm {} \;

env virtualenv: env/bin/activate
env/bin/activate: requirements.txt
	test -f $@ || virtualenv --no-site-packages env
	$(PYENV) pip install -U pip wheel
	$(PYENV) STATIC_DEPS=true CFLAGS=-I/usr/local/include/lzma pip install -U lxml
	$(PYENV) pip install -r $<
	touch $@
