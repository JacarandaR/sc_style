#' This function helps you create a Sciensano styled plot easily
#' @param x a ggplot object
#' @param ColourPal set1, set2 or set3
#' @param Inverse Inverted colors (T or F)
#' @return a Sciensano styled ggplot
#' @export
#' @import ggplot2
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot_object <- ggplot(mtcars) +
#'   aes(disp, mpg, color = cyl) +
#'   geom_point()
#'
#' sciensano_plot(ggplot_object)
#'
sciensano_plot <- function(x = "data", ColourPal = c(
                             "#006633", "#3aaa35", "#bccf00",
                             "#fad500", "#f49e24", "#c85927",
                             "#e190bd", "#b33992", "#563b8c",
                             "#769fd3", "#57bfb7", "#298691"
                           ), Inverse = F) {
  if (!is.null(x$labels$colour) & !is.null(x$labels$fill)) {
    if (x$labels$fill == "fill") {
      x[["layers"]][[1]][["aes_params"]][["colour"]] <- ColourPal[2]
      x[["layers"]][[1]][["aes_params"]][["fill"]] <- ColourPal[3]
      x[["layers"]][[1]][["aes_params"]][["alpha"]] <- 0.5
    } else if (any(class(data.frame(x$data[(x$labels$fill)])[, 1]) %in% c("factor", "character")) == T) {
      x <- x + ggplot2::scale_color_manual(values = ColourPal) +
        ggplot2::scale_fill_manual(values = ColourPal)
    } else if (any(class(data.frame(x$data[(x$labels$fill)])[, 1]) %in% c("numeric", "interger")) == T) {
      x <- x + ggplot2::scale_colour_gradient(
        low = ColourPal[1], high = ColourPal[3],
        space = "Lab", na.value = "grey50", aesthetics = "colour", guide = ggplot2::guide_colourbar()
      ) + ggplot2::guides(colour = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4)) +
        ggplot2::scale_fill_gradient(
          low = ColourPal[1], high = ColourPal[3],
          space = "Lab", na.value = "grey50", aesthetics = "fill", guide = ggplot2::guide_colourbar()
        ) + ggplot2::guides(fill = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4))
    }
  } else if (!is.null(x$labels$colour)) {
    if (any(class(data.frame(x$data[(x$labels$colour)])[, 1]) %in% c("factor", "character")) == T) {
      x <- x + ggplot2::scale_color_manual(values = ColourPal)
    } else if (any(class(data.frame(x$data[(x$labels$colour)])[, 1]) %in% c("numeric", "interger")) == T) {
      x <- x + ggplot2::scale_colour_gradient(
        low = ColourPal[1], high = ColourPal[3],
        space = "Lab", na.value = "grey50", aesthetics = "colour", guide = ggplot2::guide_colourbar()
      ) + ggplot2::guides(colour = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4))
    }
  } else if (!is.null(x$labels$fill)) {
    if (x$labels$fill == "fill") {
      x[["layers"]][[1]][["aes_params"]][["colour"]] <- ColourPal[2]
      x[["layers"]][[1]][["aes_params"]][["fill"]] <- ColourPal[3]
      x[["layers"]][[1]][["aes_params"]][["alpha"]] <- 0.5
    }else if (any(class(data.frame(x$data[(x$labels$fill)])[, 1]) %in% c("factor", "character")) == T) {
      x <- x + ggplot2::scale_fill_manual(values = ColourPal)
    }else if (any(class(data.frame(x$data[(x$labels$fill)])[, 1]) %in% c("numeric", "interger")) == T) {
      x <- x + ggplot2::scale_fill_gradient(
        low = ColourPal[1], high = ColourPal[3],
        space = "Lab", na.value = "grey50", aesthetics = "fill", guide = ggplot2::guide_colourbar()
      ) + ggplot2::guides(fill = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4)) +
        ggplot2::scale_fill_gradient(
          low = ColourPal[1], high = ColourPal[3],
          space = "Lab", na.value = "grey50", aesthetics = "colour", guide = ggplot2::guide_colourbar()
        ) + ggplot2::guides(colour = ggplot2::guide_colourbar(barwidth = 10, barheight = 0.4))
    }
  } else {
    x[["layers"]][[1]][["aes_params"]][["colour"]] <- ColourPal[2]
    x[["layers"]][[1]][["aes_params"]][["fill"]] <- ColourPal[3]
    x[["layers"]][[1]][["aes_params"]][["alpha"]] <- 0.5
  }

  x <- x + ggplot2::theme_minimal() +
    ggplot2::theme(strip.background = ggplot2::element_rect(colour = "gray", fill = ColourPal[2])) +
    ggplot2::theme(
      strip.text.x = ggplot2::element_text(color = "white", face = "bold"),
      strip.text.y = ggplot2::element_text(color = "white", face = "bold"), legend.position = "top", legend.justification = "right", legend.title = ggplot2::element_text(size = 9, vjust = 1)
    ) + ggplot2::theme(legend.key.size = ggplot2::unit(0.4, "cm"))

  if (class(x$facet)[1] == "FacetWrap") {
    if (length(x$facet$params$facets) == 1) {
      x + ggplot2::theme(legend.position = c(1, 1.12), legend.direction = "horizontal", plot.title = ggplot2::element_text(vjust = 10), plot.margin = ggplot2::margin(1.2, 0.5, 0.5, 0.5, "cm"))
    } else if (length(x$facet$params$facets) == 2) {
      x + ggplot2::theme(legend.position = c(1, 1.20), legend.direction = "horizontal", plot.title = ggplot2::element_text(vjust = 10), plot.margin = ggplot2::margin(1, 0.5, 0.5, 0.5, "cm"))
    }
  } else if (class(x$facet)[1] == "FacetGrid") {
    if (length(x$facet$params$cols) == 1) {
      x + ggplot2::theme(legend.position = c(0.99, 1.12), legend.direction = "horizontal", plot.title = ggplot2::element_text(vjust = 7.6), plot.margin = ggplot2::margin(1.2, 0.5, 0.5, 0.5, "cm"))
    } else if (length(x$facet$params$cols) == 0) {
      x + ggplot2::theme(legend.position = c(0.99, 1.05), legend.direction = "horizontal", legend.box = "horizontal", plot.title = ggplot2::element_text(vjust = 10), plot.margin = ggplot2::margin(1.3, 0.5, 0.5, 0.5, "cm"))
    }
  } else {
    x
  }
  if (Inverse==T) {
    x<-x+
      ggplot2::theme(axis.text.x = ggplot2::element_text(colour = "white"),
                     axis.text.y = ggplot2::element_text(colour = "white")) +
      ggplot2::theme(panel.grid.major = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank())+
      ggplot2::theme(axis.line = ggplot2::element_line(colour = "white"))+
      ggplot2::theme(panel.background = ggplot2::element_rect(fill = ColourPal[2],
                                                              colour = ColourPal[2],
                                                              size = 0.5, linetype = "solid"),
                     plot.background = ggplot2::element_rect(fill = ColourPal[2], color=ColourPal[2]))+
      ggplot2::theme(axis.title.x = ggplot2::element_text(colour = "white"),
                     axis.title.y = element_text(colour = "white"))+

      ggplot2::theme(strip.text = ggplot2::element_text(face = "bold", color = "gray93"))+
      ggplot2::theme(strip.background = ggplot2::element_rect(colour = "gray93", fill = "gray93")) +
      ggplot2::theme(strip.text.x = ggplot2::element_text(color = ColourPal[2], face = "bold"),
        strip.text.y = ggplot2::element_text(color = ColourPal[2], face = "bold"))
    x[["layers"]][[1]][["aes_params"]][["colour"]] <- "white"
    x[["layers"]][[1]][["aes_params"]][["fill"]] <- "white"
    x[["layers"]][[1]][["aes_params"]][["alpha"]] <- 0.5


  }
  return(x)
}
