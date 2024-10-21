
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggfitz

<!-- badges: start -->

[![R-CMD-check](https://github.com/emmarshall/ggfitz/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/emmarshall/ggfitz/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The `ggfitz` package is designed for personal use and teaching the power
of Fitz to students of data science. It provides an easy to use geom for
adding Fitz to ggplot2 objects.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("emmarshall/ggfitz")
```

## Examples

<img src="man/figures/README-default-1.png" width="100%" style="display: block; margin: auto;" />

<img src="man/figures/README-options-1.png" width="100%" style="display: block; margin: auto;" />

## Fitz `(default)`

``` r
ggplot(mtcars) +
  geom_fitz(aes(mpg, wt), fitz = "fitz") + theme_em()
```

<img src="man/figures/README-fitz-1.png" width="100%" style="display: block; margin: auto;" />

## Fitz `smart`

<img src="man/figures/README-smart-1.png" width="100%" style="display: block; margin: auto;" />

## Fitz `student`

<img src="man/figures/README-student-1.png" width="100%" style="display: block; margin: auto;" />

## Fitz `sleep`

<img src="man/figures/README-sleep-1.png" width="100%" style="display: block; margin: auto;" />

## Fitz `shade`

<img src="man/figures/README-shade-1.png" width="100%" style="display: block; margin: auto;" />

## Fitz `cool`

<img src="man/figures/README-cool-1.png" width="100%" style="display: block; margin: auto;" />

## Fitz `captain`

<img src="man/figures/README-captain-1.png" width="100%" style="display: block; margin: auto;" />

## Acknowledgements

This package is inspired by the
[`ggbernie`](https://github.com/R-CoderDotCom/ggbernie) and
[`ggcats`](https://github.com/R-CoderDotCom/ggcats) packages from the
memeverse. My primary contribution was the Fitz.
