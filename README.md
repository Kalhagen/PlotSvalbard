PlotSvalbard
======
**Plot research data from Svalbard on maps**

This is a developmental version of the **PlotSvalbard** package providing functions to plot research data from Svalbard on detailed and up-to-date maps that are not available in online databases. The package is developed by the Norwegian Polar Institute. Glacier fronts and land shapes of Kongsfjorden originate from July 2017.

As the package is in an early developmental phase, functions might not work as intended. Note that the package comes with absolutely no warranty and that maps generated by the package might be wrong. Any bug reports and code fixes are warmly welcomed. See *Contributions and contact information* for further details.

**PlotSvalbard** is based on [**ggplot2**](http://ggplot2.tidyverse.org/reference/) and the functions can be expanded using ggplot syntax.

Installation of the GitHub version
-------
Using the [**devtools**](https://cran.r-project.org/web/packages/devtools/index.html) package:

```r
library(devtools)
install_github("MikkoVihtakari/PlotSvalbard", dependencies = TRUE)
```

Usage
-------
**PlotSvalbard** extends on [**ggplot2**](http://ggplot2.tidyverse.org/reference/). Data that contains geographic information can be plotted on these maps using the ggplot2 layers separated by the `+` operator.

### User manual and website

Detailed information on how to use the package can be found from [the user manual](https://mikkovihtakari.github.io/PlotSvalbard/articles/PlotSvalbard_user_manual.html) and [PlotSvalbard website](https://mikkovihtakari.github.io/PlotSvalbard/index.html).

### Making a map with text

```r
library(PlotSvalbard)

data("kongsfjord_moorings")

basemap("kongsfjorden", limits = c(11.3, 12.69, 78.86, 79.1), round.lat = 0.05, round.lon = 0.5) + 
geom_text(data = kongsfjord_moorings, aes(x = lon.utm, y = lat.utm, label = Mooring.name, color = Name), 
fontface = 2, size = 25.4/72.27*8) # font size = 8, see Graphical parameters
```
![alt text](https://github.com/MikkoVihtakari/PlotSvalbard/blob/master/inst/figures/interpolated_kongsfjord.png)

### Combining extensions for ggplot2

Most extensions for ggplot2 work together with PlotSvalbard.

```r
data(zooplankton)

x <- cbind(transform_coord(zooplankton, lon = "Longitude", lat = "Latitude"), zooplankton)

species <- colnames(x)[!colnames(x) %in% c("lon.utm", "lat.utm", "ID", "Longitude", "Latitude", "Total")]

library(scatterpie)

basemap("barentssea", limits = c(4, 24, 79.5, 83.5), round.lon = 2, round.lat = 1) +
geom_scatterpie(aes(x = lon.utm, y = lat.utm, group = ID, r = 100*Total), data = x, cols = species, size = 0.1) +
scale_fill_discrete(name = "Species", breaks = species, 
labels = parse(text = paste0("italic(" , sub("*\\.", "~", species), ")")))
```
![alt text](https://github.com/MikkoVihtakari/PlotSvalbard/blob/master/inst/figures/scatterpie.png)

Data sources and citations
-------

If you use the package to make maps for your publications, please cite it. For up-to-date citation information, please use:

```r
citation("PlotSvalbard")
```

The maps generated by this package should be cited to their original source. 

- Svalbard maps are property of the [Norwegian Polar Institute](http://geodata.npolar.no/)
- Barents Sea and pan-Arctic maps are downloaded from [Natural Earth Data](http://www.naturalearthdata.com/downloads/10m-physical-vectors/10m-land/)
- Bathymetry shapefiles are generalized from [IBCAO v3.0 500m RR grid](https://www.ngdc.noaa.gov/mgg/bathymetry/arctic/ibcaoversion3.html)

The example data included in the package are property of the Norwegian Polar Institute and should not be used in other instances. I.e. these data are unpublihed at the moment.

PlotSvalbard depends on many packages (see **Dependencies**). If you use these packages in your publications, please cite the respective packages.

Contributions and contact information
-------
Any contributions to the package are more than welcome. Please contact the package creator Mikko Vihtakari (<mikko.vihtakari@gmail.com>) to discuss your ideas on improving the package.

Dependencies
--------
The **PlotSvalbard** package depends on:

- [ggplot2][ggplot2]: PlotSvalbard expands on ggplot2.
- [sp][sp]: Used to handle geographical information.
- [maptools][maptools]: Used to handle geographical information.
- [rgdal][rgdal]: Used to handle geographical information.
- [rgeos][rgeos]: Used to generalize and clip shapefiles.
- [colorRamps][colorRamps]: matlab.like color scheme is used in 2D surface colors.
- [gstat][gstat]: the krige function is used for interpolation.
- [oce][oce]: Used for trapetsoidal intergration.
- [broom][broom]: Used to transform shapefiles to data frames for ggplot2.

[sp]: https://cran.r-project.org/web/packages/sp/index.html
[ggplot2]: http://ggplot2.tidyverse.org/reference/
[oce]: https://cran.r-project.org/web/packages/oce/index.html
[colorRamps]: https://cran.r-project.org/web/packages/colorRamps/index.html
[gstat]: https://cran.r-project.org/web/packages/gstat/index.html
[rgdal]: https://cran.r-project.org/web/packages/rgdal/index.html
[maptools]: https://cran.r-project.org/web/packages/maptools/index.html
[rgeos]: https://cran.r-project.org/web/packages/rgeos/index.html
[broom]: https://cran.r-project.org/web/packages/broom/index.html
