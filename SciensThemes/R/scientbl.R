#' sciensano_table() is using the flextable package to style your tables.
#' It can be used within any type of Rmarkdown.
#'
#' @param x a table
#' @param caption a caption
#' @param autofit default to FALSE, set to TRUE for page fitting tables in Word Rmd.
#' @param scroll default to TRUE, adds a scroll for tables bigger than 20 rows (only in HTLM format).
#'
#' @return a Sciensano styled table
#' @export
#'
#' @examples
#' sciensano_table(head(mtcars))
#'
sciensano_table <- function(x, caption=NULL, autofit=F, scroll=T) {
  Nrow<-nrow(x)
  x<-flextable::flextable(x)
  x <-flextable::theme_booktabs(x, bold_header = TRUE)
  x <- flextable::fontsize(x, size =10, part = "all")
  x <- flextable::font(x, fontname = "Arial", part = "all")
  x <- flextable::align(x, align = "left", part = "all")
  x <- flextable::bold(x, bold = TRUE, part = "header")
  x <- flextable::bg(x, bg = "#3aaa35", part = "header")
  x <- flextable::color(x, color = "white", part = "header")
  x <- flextable::border_inner_h(x, part="all", border = flextable::fp_border_default(color="gray", width = 1))
  x <- flextable::border_inner_v( x , part="all", border = flextable::fp_border_default(color="gray", width = 1) )
  x <- flextable::border_outer( x , part="all", border = flextable::fp_border_default(color="gray", width = 1.5) )

  x<-flextable::set_table_properties(x,opts_html = list(scroll = list()))
  if (Nrow>=20 & scroll==T) {
    x<-flextable::set_table_properties(x,opts_html = list(scroll = list(height = "550px")))
  }
  if (autofit==T) {
    x<-flextable::set_table_properties(x,width = 1, layout = "autofit")
  }
  flextable::set_caption(x,caption = caption)
}
