# test for one pair

test for one pair

## Usage

``` r
one_pair(x)
```

## Arguments

- x:

  a vector of cards

## Value

logical(1)

## Examples

``` r
d = build_deck()
hand_1 = c(d[1], d[14], d[2:4] )
hand_1
#> [1] "2 ♡" "2 ♢" "3 ♡" "4 ♡" "5 ♡"
one_pair(hand_1)
#> [1] TRUE
hand_2 = c(d[1], d[6], d[2:4] )
hand_2
#> [1] "2 ♡" "7 ♡" "3 ♡" "4 ♡" "5 ♡"
one_pair(hand_2)
#> [1] FALSE
```
