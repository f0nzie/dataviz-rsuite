# dataviz-rsuite


## ebook built with `rsuite`. How is this different
This bookdown ebook [**Fundamentals of Data Visualization**](https://www.amazon.com/gp/product/1492031089) was originally created with `bookdown` by its author [Claus Wilke](@ClausWilke). The version here is different in the way it has been built, and can be rebuilt, even from the bare metal.

I have used `rsuite` to make it fully reproducible and easier to knit. This ebook is, in some way, difficult to match or keep all the dependencies. Some packages will not be found in [CRAN](), or have newer versions in Github. To save all the package installation in the R global environment, I have chosen to create the book in an isolated environment with rsuite.
Besides, since not all good things last forever, after a package upgrade the ebook may stop building. These are all the packages required to build this ebook:

```
  logging,
  bookdown,
  dviz.supp,
  tidyverse,
  patchwork,
  ggforce,
  ggrepel,
  ggridges,
  ggthemes,
  ggmap,
  ggtextures,
  ggplot2movies,
  ggspatial,
  gridExtra,
  treemapify,
  hexbin,
  magick,
  maps,
  tidybayes,
  broom,
  mgcv,
  emmeans,
  ungeviz,
  gganimate,
  RColorBrewer,
  gapminder,
  nycflights13,
  forcats,
  statebins,
  sf,
  geofacet,
  tidyr,
  tibble,
  dplyr,
  plot3D,
  stringr,
  lubridate,
  rworldmap,
  lwgeom,
  rstanarm,
  gifski,
  transformr
```  

## How is it done

So, what I did is creating an isolated [rsuite]((https://rsuite.io/)) master project for the book, one where all the packages are spelled out in advance so the ebook can be rebuilt after: (i) an R re-installation, (ii) a new R version, or (iii) a full package upgrade. The book will be able to be regenerated to the CRAN snapshot at the date it was first succesfully built.

Because `rsuite` allows a supervising project on top of other projects or packages, you can control the:

1. date of the snapshot; 
1. R version under you want the book to be built; 
1. names of all the packages that satisfy the dependencies for the book to work; 
1. define a place for the source code of the package if the package is not in CRAN; 
1. a master project and a master package that takes care of reproducing the whole book, again and again, even after changing the operating system.
1. a master environment with its own scripts and configuration files on top of projects and packages.
1. depend less on `make`


## How to reproduce this ebook yourself
* Download and install the [RSuite](https://rsuite.io/) client. Available for Linux, Mac and Windows.
* Install the rsuite package with `rsuite install`
* Clone or download the ebook [repository](https://github.com/f0nzie/dataviz-rsuite)
* Change to this repo folder and install the dependencies on its own isolated reproducible environment. Use `rsuite proj depsinst`
* Build the project with `rsuite proj build`
* In the terminal type this:

```
dataviz-rsuite$  Rscript R/build_final.R
```

Or this:

```
dataviz-rsuite$  Rscript R/build_draft.R
```

* Open the file `index.html` from the folder `work/dataviz/_book_final` or `work/dataviz/_book`.


## Publishing this book in Github pages
To publish this book in Github pages:

1. Push the folder `./work/dataviz/_book_final` as the branch `gh-pages` with this `git` command from your terminal:

```
git subtree push --prefix work/dataviz/_book_final https://github.com/f0nzie/dataviz-rsuite.git gh-pages
```

2. Activate `gh-pages` in your Github repository.

> If you are building this in your own machine and own repository, change my username `f0nzie` by your own. This example assumes you are using `https` instead of `ssh`. 

3. Call this version of the book website from: [https://f0nzie.github.io/dataviz-rsuite/](https://f0nzie.github.io/dataviz-rsuite/)


## References
* [Original repository](https://github.com/clauswilke/dataviz)
* [Online ebook](http://serialmentor.com/dataviz)
* [Author's website](https://serialmentor.com/blog/)
* [Bookdown website](https://bookdown.org/)
* [RSuite](https://rsuite.io/)
* [CRAN]()
