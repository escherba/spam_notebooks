# Some R and Python notebooks for spam analysis

## Installing

To get a working LaTeX installation on Mac, it is sufficient to
download BasicTeX:
http://www.tug.org/mactex/morepackages.html

On Mavericks you will also need to:
    ln -s /Library/TeX/Distributions/Programs/texbin /usr/texbin

Don't forget to add /usr/texbin to your path to make PDF exporting work.

After you're done with the above, run

    make install_latex_deps

(This may require `sudo` permissions).

## Building

To start a Jupyter server:

    make server

You can generate PDF output from Notebooks by entering

     make pdfs

To generate other output formats (for example slides) refer to nbconvert help:

    ipython nbconvert --help


## Viewing

You can view some of these notebooks through the NBViewer or you can download
pdfs from the results/ directory.

http://nbviewer.ipython.org/github/escherba/spam_notebooks/blob/master/preprocessing.ipynb
http://nbviewer.ipython.org/github/escherba/spam_notebooks/blob/master/history_modeling.ipynb
http://nbviewer.ipython.org/github/escherba/spam_notebooks/blob/master/southern_women.ipynb
