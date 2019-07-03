

# Technical notes {-}

The entire book was written in R Markdown, using the **bookdown**, **rmarkdown**, and **knitr** packages. All figures were made with **ggplot2**, with the help of add-on packages **cowplot**, **egg**, **ggforce**, **ggrepel**, **ggridges**, **sf**, and **treemapify**. Color manipulations were done with the **colorspace** and **colorblindr** packages. For many of these packages, the current development version is required to compile all parts of the book.

The source code for the book is available here: https://github.com/clauswilke/dataviz. The book also requires a supporting R package, **dviz.supp**, whose code is available here: https://github.com/clauswilke/dviz.supp.

The book was last compiled using the following environment:

```
## R version 3.6.0 (2019-04-26)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 18.04.2 LTS
## 
## Matrix products: default
## BLAS:   /opt/R/3.6.0/lib/R/lib/libRblas.so
## LAPACK: /opt/R/3.6.0/lib/R/lib/libRlapack.so
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
##  [1] nycflights13_1.0.0 gapminder_0.3.0    RColorBrewer_1.1-2
##  [4] gganimate_1.0.3    ungeviz_0.1.0      emmeans_1.3.5.1   
##  [7] mgcv_1.8-28        nlme_3.1-140       broom_0.5.2       
## [10] tidybayes_1.1.0    maps_3.3.0         statebins_2.0.0   
## [13] sf_0.7-4           maptools_0.9-5     rgeos_0.4-3       
## [16] sp_1.3-1           ggspatial_1.0.3    geofacet_0.1.10   
## [19] plot3D_1.1.1       magick_2.0         hexbin_1.27.3     
## [22] treemapify_2.5.3   gridExtra_2.3      ggmap_3.0.0       
## [25] ggthemes_4.2.0     ggridges_0.5.1     ggrepel_0.8.1     
## [28] ggforce_0.2.2      patchwork_0.0.1    lubridate_1.7.4   
## [31] forcats_0.4.0      stringr_1.4.0      purrr_0.3.2       
## [34] readr_1.3.1        tidyr_0.8.3        tibble_2.1.3      
## [37] tidyverse_1.2.1    dviz.supp_0.1.0    dplyr_0.8.1       
## [40] colorblindr_0.1.0  ggplot2_3.2.0      colorspace_1.4-1  
## [43] cowplot_0.9.99     logging_0.9-107   
## 
## loaded via a namespace (and not attached):
##  [1] rjson_0.2.20              class_7.3-15             
##  [3] rprojroot_1.3-2           estimability_1.3         
##  [5] ggstance_0.3.2            rstudioapi_0.10          
##  [7] farver_1.1.0              ggfittext_0.8.0          
##  [9] svUnit_0.7-12             mvtnorm_1.0-11           
## [11] xml2_1.2.0                splines_3.6.0            
## [13] knitr_1.23                polyclip_1.10-0          
## [15] jsonlite_1.6              png_0.1-7                
## [17] shiny_1.3.2               compiler_3.6.0           
## [19] httr_1.4.0                backports_1.1.4          
## [21] Matrix_1.2-17             assertthat_0.2.1         
## [23] lazyeval_0.2.2            cli_1.1.0                
## [25] later_0.8.0               tweenr_1.0.1             
## [27] prettyunits_1.0.2         htmltools_0.3.6          
## [29] tools_3.6.0               misc3d_0.8-4             
## [31] coda_0.19-2               gtable_0.3.0             
## [33] glue_1.3.1                Rcpp_1.0.1               
## [35] cellranger_1.1.0          imguR_1.0.3              
## [37] xfun_0.8                  strapgod_0.0.2           
## [39] rvest_0.3.4               mime_0.7                 
## [41] MASS_7.3-51.4             scales_1.0.0             
## [43] hms_0.4.2                 promises_1.0.1           
## [45] yaml_2.2.0                stringi_1.4.3            
## [47] e1071_1.7-2               RgoogleMaps_1.4.3        
## [49] rlang_0.4.0               pkgconfig_2.0.2          
## [51] bitops_1.0-6              geogrid_0.1.1            
## [53] evaluate_0.14             lattice_0.20-38          
## [55] tidyselect_0.2.5          plyr_1.8.4               
## [57] magrittr_1.5              bookdown_0.11            
## [59] R6_2.4.0                  generics_0.0.2           
## [61] DBI_1.0.0                 pillar_1.4.1             
## [63] haven_2.1.0               foreign_0.8-71           
## [65] withr_2.1.2               units_0.6-3              
## [67] modelr_0.1.4              crayon_1.3.4             
## [69] arrayhelpers_1.0-20160527 KernSmooth_2.23-15       
## [71] rmarkdown_1.13            progress_1.2.2           
## [73] jpeg_0.1-8                rnaturalearth_0.1.0      
## [75] grid_3.6.0                readxl_1.3.1             
## [77] digest_0.6.19             classInt_0.3-3           
## [79] xtable_1.8-4              httpuv_1.5.1             
## [81] munsell_0.5.0
```
