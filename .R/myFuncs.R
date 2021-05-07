options("digits.secs"=3)            # show sub-second time stamps


## Create invisible environment ot hold all your custom functions
.env <- new.env()

## Single character shortcuts for summary() and head().
.env$s <- base::summary
.env$h <- utils::head
.env$n <- base::names

# https://stackoverflow.com/questions/25576358/calculate-cumsum-while-ignoring-na-values
.env$cumSkipNA <- function(x, FUNC)
{
  d <- deparse(substitute(FUNC))
  funs <- c("max", "min", "prod", "sum")
  stopifnot(is.vector(x), is.numeric(x), d %in% funs)
  FUNC <- match.fun(paste0("cum", d))
  x[!is.na(x)] <- FUNC(x[!is.na(x)])
  x
}

# Load my custom favourite packages
.env$pkgLoad <- function( packages = "favourites" ) {

    if( length( packages ) == 1L && packages == "favourites" ) {
        packages <- c( "tidyverse", "ggplot2", "dplyr", "testthat"
        )
    }

    packagecheck <- match( packages, utils::installed.packages()[,1] )

    packagestoinstall <- packages[ is.na( packagecheck ) ]

    if( length( packagestoinstall ) > 0L ) {
        utils::install.packages( packagestoinstall,
                             repos = "http://cran.csiro.au"
        )
    } else {
        print( "All requested packages already installed" )
    }

    for( package in packages ) {
        suppressPackageStartupMessages(
            library( package, character.only = TRUE, quietly = TRUE )
        )
    }

}

# Load the required data
.env$load_sqlite3_data <- function(databasepath, tablename) {
  sqlite.driver <- dbDriver("SQLite")
  db <- dbConnect(sqlite.driver, dbname = databasepath)
  table <- dbReadTable(db,tablename)
  dbDisconnect(db)
  return(as_tibble(table))
}

.env$remove_extra_quotes <- function(.data, name){
  name <- enquo(name)
  .data %>% 
    mutate(!!quo_name(name) := gsub("\"","", !!name))
}

.env$not_all_missing <- function(x) any(!is.na(x))


'%!in%' <- function(x,y)!('%in%'(x,y))

'%ni%' <- Negate('%in%')

.env$ggplotRegression <- function (fit) {

  require(ggplot2)

  ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(title = paste("Adj R2 = ",signif(summary(fit)$adj.r.squared, 5),
                       "Intercept =",signif(fit$coef[[1]],5 ),
                       " Slope =",signif(fit$coef[[2]], 5),
                       " P =",signif(summary(fit)$coef[2,4], 5)))
}


.env$workspaceimage.saver <- save.image(paste(gsub(":", "-", Sys.time()),".RDS",sep=""))