
all: inst/README.markdown

inst/README.markdown: inst/README.Rmd
	Rscript -e "library(knitr); library(methods); knit('$<', output = '$@', quiet = TRUE)"


