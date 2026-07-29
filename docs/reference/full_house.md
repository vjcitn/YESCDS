# test for full house

test for full house

## Usage

``` r
full_house(x)
```

## Arguments

- x:

  a vector of cards

## Examples

``` r
d = build_deck()
h1 = c(d[1], d[14], d[27], d[2], d[15])
h1
#> [1] "2 ♡" "2 ♢" "2 ♣" "3 ♡" "3 ♢"
full_house(h1)
#> [1] TRUE
h2 = c(d[1], d[14], d[27], d[2], d[16])
h2
#> [1] "2 ♡" "2 ♢" "2 ♣" "3 ♡" "4 ♢"
full_house(h2)
#> [1] FALSE
```
