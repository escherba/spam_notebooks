.PHONY: clean virtualenv upgrade test package

PYENV = . env/bin/activate;
PYTHON = $(PYENV) python
PYTHON_TIMED = $(PYENV) time python

clean:
	find . -type f -name "*.pyc" -exec rm {} \;

nuke: clean
	rm -rf *.egg *.egg-info env

env virtualenv: env/bin/activate
env/bin/activate: requirements.txt
	[ -x "`which virtualenv`" ] || pip install virtualenv
	test -f $@ || virtualenv --no-site-packages env
	easy_install ipython
	$(PYENV) pip install --process-dependency-links -r requirements.txt
	touch $@

upgrade: env
	$(PYENV) pip install --process-dependency-links -r requirements.txt --upgrade
