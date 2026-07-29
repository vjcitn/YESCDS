# get suits of a collection of cards

get suits of a collection of cards

## Usage

``` r
suits(x)
```

## Arguments

- x:

  a card from a deck made by \`build_deck\`

## Examples

``` r
d = build_deck()
d[1]
#> [1] "2 ♡"
suits(d[1:2])
#> [1] "♡" "♡"
```
