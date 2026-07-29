# test for flush

test for flush

## Usage

``` r
is_flush(x)
```

## Arguments

- x:

  a vector of cards

## Examples

``` r
d = build_deck()
h1 = c(d[1:4], d[6])
h1
#> [1] "2 ♡" "3 ♡" "4 ♡" "5 ♡" "7 ♡"
is_flush(h1)
#> [1] TRUE
```
