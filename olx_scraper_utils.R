get_html_pages <- function(urls) map(urls,read_html)
get_html_href <- function(pages,css) map(pages,~(html_nodes(.x,css) %>%
                                                   html_attr("href")))
get_html_text <- function(pages,css) map(pages, ~(.x %>%
                                                    html_nodes(css) %>%
                                                    html_text %>%
                                                    str_trim))

# Obtains list of clickable pages from bottom of main page
getPageNumbers <- function(page) page %>%
  html_nodes(".number") %>%
  html_text %>%
  str_trim() %>%
  as.integer()

# Civic, Corolla, Sentra, RJ, km < 80000, price < R$80000, year >= 2016, particular
olxBase <- "http://rj.olx.com.br/veiculos-e-pecas/carros"
olxURL <- function(brand,model,maxPrice=80000,maxKm=80000)
  glue("{olxBase}s/{brand}/{model}?f=p&me={maxPrice}&pe={maxKm}&rs=34")
olxURL_page <- function(brand,model,page,maxPrice=80000,maxKm=80000)
  glue("{olxBase}/{brand}/{model}?f=p&me={maxPrice}&o={page}&pe={maxKm}&rs=34")

convertReais <- function(s) s %>%
  str_replace_all("[^\\d]+","") %>%
  as.integer()

# Vindo assim: "33.000 km\n\t\t | Câmbio: automático\n\t\t | Flex"
clearMkCambioMotor <- function(s) 
  str_c(s[1] %>% str_replace("\\.","") %>% str_replace(" [kK]m",""),
        s[2] %>% str_replace("Câmbio: ",""),
        s[3],sep="|")

decodeKmCambioMotor <- function(s) s %>%
  str_replace_all("[\\n\\t]","") %>%
  str_split("\\|") %>%
  map(~str_trim(.x,"both")) %>%
  map(~clearMkCambioMotor(.x))

#Avoids collapsing "\n" into nothing
# https://github.com/hadley/rvest/issues/175
html_text_collapse <- function(x, trim = FALSE, collapse = "\n")
  UseMethod("html_text_collapse")
html_text_collapse.xml_nodeset <- function(x, trim = FALSE, collapse = "\n")
  vapply(x, html_text_collapse.xml_node,character(1), trim = trim, collapse = collapse)
html_text_collapse.xml_node <- function(x, trim = FALSE, collapse = "\n")
  paste(xml2::xml_find_all(x, ".//text()"), collapse = collapse)

# Versão do get_html_text com o workaround para inserir "\n" nos <br>
get_html_text_collapse <- function(pages,css) {
  text <- unlist(map(pages,~html_text_collapse(html_nodes(.x,css))))
  text %>% str_trim("both")
}

compressModel <- function(s) s %>%
  str_replace("((TOYOTA|NISSAN|HONDA)? (COROLLA|SENTRA|CIVIC)?)",
              "\\1\n") %>%
  str_replace(" (AUT\\..*)$","\n\\1")
