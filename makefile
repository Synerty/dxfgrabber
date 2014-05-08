# Author:  mozman
# License: MIT-License

FLAGS = --inplace --force
CMD = setup.py build_ext
RUNTESTS = -m unittest discover -s tests

PYTHON2 = py -2.7
PYTHON3 = py -3
PYPY = pypy.exe
PYPY3 = C:\pypy3-2.1\pypy.exe

build2:
	$(PYTHON2)  $(CMD) $(FLAGS)

build3:
	$(PYTHON3) $(CMD) $(FLAGS)

test2:
	$(PYTHON2) $(RUNTESTS)

test3:
	$(PYTHON3) $(RUNTESTS)

testpypy:
	$(PYPY) $(RUNTESTS)

testpypy3:
	$(PYPY3) $(RUNTESTS)

testall: build2 test2 build3 test3 testpypy testpypy3

packages:
	$(PYTHON2) setup.py sdist --formats=zip,gztar
	$(PYTHON2) setup.py bdist --formats=msi,wininst
	$(PYTHON3) setup.py bdist --formats=msi,wininst

release:
	$(PYTHON2) setup.py sdist --formats=zip,gztar upload
	$(PYTHON2) setup.py bdist --formats=wininst upload
	$(PYTHON3) setup.py bdist --formats=wininst upload
