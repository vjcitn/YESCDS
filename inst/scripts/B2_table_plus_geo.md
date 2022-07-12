# Basic geographic data about US counties

The coordinates of central locations in US counties are provided in
`us_county_geo`.

    data(us_county_geo)
    us_county_geo |> select(state, county, geometry) |> head()

Coordinates for metropolitan statistical areas are provided by
“statcrunch”:

    data(statcrunch_msa)
    head(statcrunch_msa)

This geographic data has already been used to enhance the CDC incidence
data in `woncan`:

    data(woncan)
    woncan |> group_by(MSA) |> 
        summarize(lat=head(lat)[1], lng=head(lng)[1]) |> head()

## Exercise

B.2.1 Create a new notebook cell and run
`YESCDS::table_woncan("Prostate")`

B.2.2 Use this table to find the latitude and longitude of Boston.

## Answers

B.2.1

B.2.2

# An interactive map of the US with cancer rates

After combining cancer rate data for a collection of cancer types and
metropolitan statistical areas, we can produce a map showing variation
in cancer incidence over the United States. Here is the example for
stomach cancer:

    cancer_map_usa(site="Stomach")

## Exercise

B.2.3 Create a new notebook cell and run
`cancer_map_usa(site="Prostate", scaling=0.05)`

B.2.4 Can you identify the area with the highest incidence of prostate
cancer?

## Answers

B.2.3

B.2.4

# A data graphic

Finally, to get a different view of variation in cancer rates across the
United States, run a cell with the following command. Geographic
location is lost, but the range of variation, and details of variation
can be seen very clearly in these displays.

    browseURL("https://vjcitn.shinyapps.io/ratevariation")

## Exercise

B.2.5 Change the body site to “Pancreas” (remove “Brain”) and find,
using the histogram tab, the areas with highest and lowest age-adjusted
rates of pancreatic cancer.

## Answer

B.2.5
