OLX Scraper: Car Priuces
================

This is an example of a scrape of the [OLX](olx.com.br) site in Brazil to compare used car prices for cars in the Imported Compact Sedan category (Corollas, Sentras, Jettas, etc).

In the companion [website](https://dan-reznik.github.io/OLX-Car-Ad-Scraper/), you can see the scraping code, which produces the following results:

### Compare prices of main models

``` r
knitr::include_graphics("pics/compare all.png")
```

<img src="pics/compare all.png" width="1344" />

### Compare price change against mileage range (in km)

``` r
knitr::include_graphics("pics/price per mileage.png")
```

<img src="pics/price per mileage.png" width="1344" />

### Categorize certain messages as suspicious if they contain certain words

``` r
knitr::include_graphics("pics/compare w sentiment.png")
```

<img src="pics/compare w sentiment.png" width="1344" />

### Recalculate mean prices eliminating suspicious messages

``` r
knitr::include_graphics("pics/ridges sentiment.png")
```

<img src="pics/ridges sentiment.png" width="1344" />
