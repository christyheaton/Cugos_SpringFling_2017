## A simple GIS workflow with Python and R - Cugos Spring Fling 2017

### Sources

* All data from the [King County GIS Data Portal](http://www5.kingcounty.gov/gisdataportal/).

* This tutorial is modified from the [Maptime Meetup workshop (Feb. 8, 2017)](https://www.meetup.com/MaptimeSEA/), which is adapted from materials prepared by [Emilio Mayorga](https://github.com/emiliom/) for the [University of Washington GeoHack week event](https://geohackweek.github.io), Nov 14-18, 2016. We'll be using [those materials ("Vector Data Processing using Python Tools")](https://geohackweek.github.io/vector/) directly in some cases, as is.

### Getting Started

* If you are familiar with [GitHub](http://www.github.com), fork and clone [the repository](https://github.com/christyheaton/Cugos_SpringFling_2017).

* If not, download the repository and unzip to a working directory.

* Install [Miniconda](https://conda.io/miniconda.html) for your operating system. Please choose the Python 2.x version of Miniconda as not all packages we'll be using are Python 3-compliant.

* Open your Anaconda prompt. Navigate to the directory containing environment.yml (included in the repo).

```bash
conda env create environment.yml  # Will create an environment called "geopandasenv"
source activate geopandasenv  # OSX and Linux
activate geopandasenv  # Windows.
```

* In your Anaconda command line with the geopandasenv activated, type in:

```bash
jupyter notebook
```

* Click on SpringFling.ipynb and off we go!
