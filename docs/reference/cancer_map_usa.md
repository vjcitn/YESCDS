# simple function for site-specific map

simple function for site-specific map

## Usage

``` r
cancer_map_usa(site = "Stomach", scaling = 1, table.only = FALSE)
```

## Arguments

- site:

  character(1) defaults to "Stomach", must lie in value of
  woncan_types()

- scaling:

  numeric(1) scales the radius of circles, defaults to 1

- table.only:

  logical(1) defaults to FALSE; if TRUE just produces CDC WONDER data
  filtered to selected site
