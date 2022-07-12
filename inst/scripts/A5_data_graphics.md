# Visualizing variability

We have been looking at cancer incidence data in the form of tables of
numbers. We can sort, search, filter these tables fairly easily. “Data
graphics”, also known as “statistical visualization”, have been devised
to help us get insights that have a different character. One objective
is to develop a sense of variation in a quantity of interest, by
aggregating data values in various ways and presenting these aggregates
in graphical form.

## Histograms

Histograms help visualize variability in a quantity of interest. The
range of the quantity of interest is “binned” – chopped up into
intervals of equal width. Midpoints of bins are plotted on the x axis,
and counts of values in bins are plotted on the y axis.

We illustrate with the CDC WONDER data on Prostate cancer incidence.

    make_hist(site="Prostate", binwidth=5, rate_table=littab)

We can change the visual character of the histogram display by reducing
the bin width.

    make_hist(site="Prostate", binwidth=2, rate_table=littab)

### Exercises

A.5.1 Based on the first histogram shown above, what is the most
commonly observed value for prostate cancer incidence (per 100,000 men)
in metropolitan statistical areas (MSAs) of the United States? You can
scroll over the display to find values for particular MSAs. Your answer
can be a range of numbers.

A.5.2 Use the first histogram to report on the number of MSAs that
report prostate cancer incidence between 142 and 147 per 100,000 men.

A.5.3 The second histogram is produced from the same set of statistics
as the first, but uses a smaller “binwidth”. Comment on some differences
between the two displays.

A.5.4 Add a cell to your notebook using the “+” button, enter the
command `make_hist(site="Female Breast")` and press the “play” button.
What is the most commonly reported rate of female breast cancer
incidence in MSAs in the US?

A.5.5 Hover over the leftmost block in the display. What is the MSA with
lowest value of Female Breast cancer incidence, and what is the reported
rate?

### Answers

A.5.1

A.5.2

A.5.3

A.5.4

A.5.5

## Using a histogram to compare cancer incidence rates in two areas

By computing differences or ratios and forming the histogram, we can
assess whether there is a tendency to higher values in one of the areas
of interest.

    ggplotly(make_comparison(rate_table=littab, type="ratios"))

More detail about individual values can be obtained with an approach
called “beeswarm” plotting.

    ggplotly(make_pair(type="beeswarm", rate_table=littab ))

### Exercises

A.5.6 The use of ratios in the `make_comparison` display above
eliminates information about the absolute incidence rates. Open a
notebook cell and use the commands

    library(YESCDS)
    library(plotly)
    data(woncan)
    ggplotly(make_comparison(rate_table=woncan, type="scatter"))

When you hover the mouse over points on the display, the individual
rates are presented.

True or False: the presence of a majority of points below and to the
right of the straight line implies that the incidence rates for a
variety of cancer types in Baton Rouge, LA are more frequently higher
than those in Tucson, AZ.

A.5.7 Using the values presented in the interactive scatterplot, compute
the ratio of incidence rates for prostate cancer in Baton Rouge compared
to those in Tucson. Compare to the result provided in the
`make_comparison` histogram above.

### Answers

A.5.6

A.5.7
