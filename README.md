OLX Scraper: Car Prices
================

``` r
knitr::include_graphics("pics/civic.jpg")
```

<img src="pics/civic.jpg" width="50%" style="display: block; margin: auto;" />

We will scrape [OLX](olx.com.br) in Brazil to compare used car prices for cars in the imported compact sedan category (Corollas, Sentras, Jettas, etc).

Refer to the companion [website](https://dan-reznik.github.io/OLX-Car-Ad-Scraper/) for low-level scraping code. Below the main results are shown:

### Price comparison per model

``` r
knitr::include_graphics("pics/compare all.png")
```

<img src="pics/compare all.png" width="1344" />

### Price change against mileage range (in km)

``` r
knitr::include_graphics("pics/price per mileage.png")
```

<img src="pics/price per mileage.png" width="1344" />

### Show data points containing suspicious words (price is not reliable)

``` r
knitr::include_graphics("pics/compare w sentiment.png")
```

<img src="pics/compare w sentiment.png" width="1344" />

### Recalculate mean prices eliminating suspicious messages

``` r
knitr::include_graphics("pics/ridges sentiment.png")
```

<img src="pics/ridges sentiment.png" width="1344" />
