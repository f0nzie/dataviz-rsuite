

# Don't go 3D {#no-3d}

3D plots are quite popular, in particular in business presentations but also among academics. They are also almost always inappropriately used. It is rare that I see a 3D plot that couldn't be improved by turning it into a regular 2D figure. In this chapter, I will explain why 3D plots have problems, why they generally are not needed, and in what limited circumstances 3D plots may be appropriate.

## Avoid gratuitous 3D

Many visualization softwares enable you to spruce up your plots by turning the plots' graphical elements into three-dimensional objects. Most commonly, we see pie charts turned into disks rotated in space, bar plots turned into columns, and line plots turned into bands. Notably, in none of these cases does the third dimension convey any actual data. 3D is used simply to decorate and adorn the plot. I consider this use of 3D as gratuitous. It is unequivocally bad and should be erased from the visual vocabulary of data scientists.

The problem with gratuitous 3D is that the projection of 3D objects into two dimensions for printing or display on a monitor distorts the data. The human visual system tries to correct for this distortion as it maps the 2D projection of a 3D image back into a 3D space. However, this correction can only ever be partial. As an example, let's take a simple pie chart with two slices, one representing 25% of the data and one 75%, and rotate this pie in space (Figure \@ref(fig:rotated-pie)). As we change the angle at which we're looking at the pie, the size of the slices seems to change as well. In particular, the 25% slice, which is located in the front of the pie, looks much bigger than 25% when we look at the pie from a flat angle (Figure \@ref(fig:rotated-pie)a).

(ref:rotated-pie) The same 3D pie chart shown from four different angles. Rotating a pie into the third dimension makes pie slices in the front appear larger than they really are and pie slices in the back appear smaller. Here, in parts (a), (b), and (c), the blue slice corresponding to 25% of the data visually occupies more than 25% of the area representing the pie. Only part (d) is an accurate representation of the data.

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/rotated-pie-1.png" alt="(ref:rotated-pie)" width="576" />
<p class="caption">(\#fig:rotated-pie)(ref:rotated-pie)</p>
</div>

Similar problems arise for other types of 3D plot. Figure \@ref(fig:titanic-3d) shows the breakdown of Titanic passengers by class and gender using 3D bars. Because of the way the bars are arranged relative to the axes, the bars all look shorter than they actually are. For example, there were 322 passengers total traveling in 1st class, yet Figure \@ref(fig:titanic-3d) suggests that the number was less than 300. This illusion arises because the columns representing the data are located at a distance from the two back surfaces on which the gray horizontal lines are drawn. To see this effect, consider extending any of the bottom edges of one of the columns until it hits the lowest gray line, which represents 0. Then, imagine doing the same to any of the top edges, and you'll see that all columns are taller than they appear at first glance. (See Figure \@ref(fig:titanic-passengers-by-class-sex) in Chapter \@ref(visualizing-amounts) for a more reasonable 2D version of this figure.) 

(ref:titanic-3d) Numbers of female and male passengers on the Titanic traveling in 1st, 2nd, and 3rd class, shown as a 3D stacked bar plot. The total numbers of passengers in 1st, 2nd, and 3rd class are 322, 279, and 711, respectively (see Figure \@ref(fig:titanic-passengers-by-class-sex)). Yet in this plot, the 1st class bar appears to represent fewer than 300 passengers, the 3rd class bar appears to represent fewer than 700 passengers, and the 2nd class bar seems to be closer to 210--220 passengers than the actual 279 passengers. Furthermore, the 3rd class bar visually dominates the figure and makes the number of passengers in 3rd class appear larger than it actually is. 

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/titanic-3d-1.png" alt="(ref:titanic-3d)" width="576" />
<p class="caption">(\#fig:titanic-3d)(ref:titanic-3d)</p>
</div>


## Avoid 3D position scales

While visualizations with gratuitous 3D can easily be dismissed as bad, it is less clear what to think of visualizations using three genuine position scales (*x*, *y*, and *z*) to represent data. In this case, the use of the third dimension serves an actual purpose. Nevertheless, the resulting plots are frequently difficult to interpret, and in my mind they should be avoided.

Consider a 3D scatter plot of fuel efficiency versus displacement and power for 32 cars. We have seen this dataset previously in Chapter \@ref(aesthetic-mapping), Figure \@ref(fig:mtcars-five-scale).  Here, we plot displacement along the *x* axis, power along the *y* axis, and fuel efficiency along the *z* axis, and we represent each car with a dot (Figure \@ref(fig:mtcars-3d)). Even though this 3D visualization is shown from four different perspectives, it is difficult to envision how exactly the points are distributed in space. I find part (d) of Figure \@ref(fig:mtcars-3d) particularly confusing. It almost seems to show a different dataset, even though nothing has changed other than the angle from which we look at the dots.

(ref:mtcars-3d) Fuel efficiency versus displacement and power for 32 cars (1973–74 models). Each dot represents one car, and the dot color represents the number of cylinders of the car. The four panels (a)--(d) show exactly the same data but use different perspectives. Data source: *Motor Trend,* 1974.


<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/mtcars-3d-1.png" alt="(ref:mtcars-3d)" width="685.714285714286" />
<p class="caption">(\#fig:mtcars-3d)(ref:mtcars-3d)</p>
</div>

The fundamental problem with such 3D visualizations is that they require two separate, successive data transformations. The first transformation maps the data from the data space into the 3D visualization space, as discussed in Chapters \@ref(aesthetic-mapping) and \@ref(coordinate-systems-axes) in the context of position scales. The second one maps the data from the 3D visualization space into the 2D space of the final figure. (This second transformation obviously does not occur for visualizations shown in a true 3D environment, such as when shown as physical sculptures or 3D-printed objects. My primary objection here is to 3D visualizations shown on 2D displays.) The second transformation is non-invertible, because each point on the 2D display corresponds to a line of points in the 3D visualization space. Therefore, we cannot uniquely determine where in 3D space any particular data point lies.

Our visual system nevertheless attempts to invert the 3D to 2D transformation. However, this process is unreliable, fraught with error, and highly dependent on appropriate cues in the image that convey some sense of three-dimensionality. When we remove these cues the inversion becomes entirely impossible. This can be seen in Figure \@ref(fig:mtcars-3d-no-axes), which is identical to Figure \@ref(fig:mtcars-3d) except all depth cues have been removed. The result is four random arrangements of points that we cannot interpret at all and that aren't even easily relatable to each other. Could you tell which points in part (a) correspond to which points in part (b)? I certainly cannot.

(ref:mtcars-3d-no-axes) Fuel efficiency versus displacement and power for 32 cars (1973–74 models). The four panels (a)--(d) correspond to the same panels in Figure \@ref(fig:mtcars-3d), only that all grid lines providing depth cues have been removed. Data source: *Motor Trend,* 1974.

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/mtcars-3d-no-axes-1.png" alt="(ref:mtcars-3d-no-axes)" width="685.714285714286" />
<p class="caption">(\#fig:mtcars-3d-no-axes)(ref:mtcars-3d-no-axes)</p>
</div>

Instead of applying two separate data transformations, one of which is non-invertible, I think it is generally better to just apply one appropriate, invertible transformation and map the data directly into 2D space. It is rarely necessary to add a third dimension as a position scale, since variables can also be mapped onto color, size, or shape scales. For example, in Chapter \@ref(aesthetic-mapping), I plotted five variables of the fuel-efficency dataset at once yet used only two position scales (Figure \@ref(fig:mtcars-five-scale)).

Here, I want to show two alternative ways of plotting exactly the variables used in Figure \@ref(fig:mtcars-3d). First, if we primarily care about fuel efficiency as the response variable, we can plot it twice, once against displacement and once against power (Figure \@ref(fig:mtcars-2d-multiple)). Second, if we are more interested in how displacement and power relate to each other, with fuel efficiency as a secondary variable of interest, we can plot power versus displacement and map fuel efficiency onto the size of the dots (Figure \@ref(fig:mtcars-2d-size)). Both figures are more useful and less confusing than Figure \@ref(fig:mtcars-3d).

(ref:mtcars-2d-multiple) Fuel efficiency versus displacement (a) and power (b). Data source: *Motor Trend,* 1974.

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/mtcars-2d-multiple-1.png" alt="(ref:mtcars-2d-multiple)" width="685.714285714286" />
<p class="caption">(\#fig:mtcars-2d-multiple)(ref:mtcars-2d-multiple)</p>
</div>

(ref:mtcars-2d-size) Power versus displacement for 32 cars, with fuel efficiency represented by dot size. Data source: *Motor Trend,* 1974.

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/mtcars-2d-size-1.png" alt="(ref:mtcars-2d-size)" width="528" />
<p class="caption">(\#fig:mtcars-2d-size)(ref:mtcars-2d-size)</p>
</div>

You may wonder whether the problem with 3D scatter plots is that the actual data representation, the dots, do not themselves convey any 3D information. What happens, for example, if we use 3D bars instead? Figure \@ref(fig:VA-death-rates-3d) shows a typical dataset that one might visualize with 3D bars, the mortality rates in 1940 Virginia stratified by age group and by gender and housing location. We can see that indeed the 3D bars help us interpret the plot. It is unlikely that one might mistake a bar in the foreground for one in the background or vise versa. Nevertheless, the problems discussed in the context of Figure \@ref(fig:titanic-3d) exist here as well. It is difficult to judge exactly how tall the individual bars are, and it is also difficult to make direct comparisons. For example, was the mortality rate of urban females in the 65--69 age group higher or lower than that of urban males in the 60--64 age group?

(ref:VA-death-rates-3d) Mortality rates in Virginia in 1940, visualized as a 3D bar plot. Mortality rates are shown for four groups of people (urban and rural females and males) and five age categories (50--54, 55--59, 60--64, 65--69, 70--74), and they are reported in units of deaths per 1000 persons. This figure is labeled as "bad" because the 3D perspective makes the plot difficult to read. Data source: @Molyneaux-et-al-1947

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/VA-death-rates-3d-1.png" alt="(ref:VA-death-rates-3d)" width="480" />
<p class="caption">(\#fig:VA-death-rates-3d)(ref:VA-death-rates-3d)</p>
</div>

In general, it is better to use Trellis plots (Chapter \@ref(multi-panel-figures)) instead of 3D visualizations. The Virginia mortality dataset requires only four panels when shown as Trellis plot (Figure \@ref(fig:VA-death-rates-Trellis)). I consider this figure clear and easy to interpret. It is immediately obvious that mortality rates were higher among men than among women, and also that urban males seem to have had higher mortality rates than rural males whereas no such trend is apparent for urban and rural females.

(ref:VA-death-rates-Trellis) Mortality rates in Virginia in 1940, visualized as a Trellis plot. Mortality rates are shown for four groups of people (urban and rural females and males) and five age categories (50--54, 55--59, 60--64, 65--69, 70--74), and they are reported in units of deaths per 1000 persons.  Data source: @Molyneaux-et-al-1947

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/VA-death-rates-Trellis-1.png" alt="(ref:VA-death-rates-Trellis)" width="685.714285714286" />
<p class="caption">(\#fig:VA-death-rates-Trellis)(ref:VA-death-rates-Trellis)</p>
</div>

## Appropriate use of 3D visualizations

Visualizations using 3D position scales can sometimes be appropriate, however. First, the issues described in the preceding section are of lesser concern if the visualization is interactive and can be rotated by the viewer, or alternatively, if it is shown in a VR or augmented reality environment where it can be inspected from multiple angles. Second, even if the visualization isn't interactive, showing it slowly rotating, rather than as a static image from one perspective, will allow the viewer to discern where in 3D space different graphical elements reside. The human brain is very good at reconstructing a 3D scene from a series of images taken from different angles, and the slow rotation of the graphic provides exactly these images.

Finally, it makes sense to use 3D visualizations when we want to show actual 3D objects and/or data mapped onto them. For example, showing the topographic relief of a mountainous island is a reasonable choice (Figure \@ref(fig:corsica-relief)). Similarly, if we want to visualize the evolutionary sequence conservation of a protein mapped onto its structure, it makes sense to show the structure as a 3D object (Figure \@ref(fig:protein-3d)). In either case, however, these visualizations would still be easier to interpret if they were shown as rotating animations. While this is not possible in traditional print publications, it can be done easily when posting figures on the web or when giving presentations.

(ref:corsica-relief) Relief of the Island of Corsica in the Mediterranean Sea. Data source: Copernicus Land Monitoring Service

<div class="figure" style="text-align: center">
<img src="figures/3d/Corsica.png" alt="(ref:corsica-relief)" width="630" />
<p class="caption">(\#fig:corsica-relief)(ref:corsica-relief)</p>
</div>


(ref:protein-3d) Patterns of evolutionary variation in a protein. The colored tube represents the backbone of the protein Exonuclease III from the bacterium *Escherichia coli* (Protein Data Bank identifier: 1AKO). The coloring indicates the evolutionary conservation of the individual sites in this protein, with dark coloring indicating conserved amino acids and light coloring indicating variable amino acids. Data source: @Marcos-Echave-2015

<div class="figure" style="text-align: center">
<img src="no_3d_files/figure-html/protein-3d-1.png" alt="(ref:protein-3d)" width="432" />
<p class="caption">(\#fig:protein-3d)(ref:protein-3d)</p>
</div>
