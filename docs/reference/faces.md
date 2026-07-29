# get faces of a collection of cards

get faces of a collection of cards

## Usage

``` r
faces(x)
```

## Arguments

- x:

  a card from a deck made by \`build_deck\`

## Examples

``` r
d = build_deck()
d[1]
#> [1] "2 ♡"
faces(d[1:2])
#> [1] "2" "3"
```
