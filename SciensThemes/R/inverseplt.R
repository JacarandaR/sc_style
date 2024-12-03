
#' inverse plot
#'
#' @param x a ggplot object
#'
#' @return
#' @export
#'
#' @examples
#'
sciensano_plotinverse_plot<-function(x){

    x+
    theme(axis.text.x = element_text(colour = "white"),
          axis.text.y = element_text(colour = "white")) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
    theme(axis.line = element_line(colour = "white"))+
    theme(panel.background = element_rect(fill = "#3aaa35",
                                          colour = "#3aaa35",
                                          size = 0.5, linetype = "solid"),plot.background = element_rect(fill = "#3aaa35", color="#3aaa35"))+ theme(axis.title.x = element_text(colour = "white"),
                                                                                                                                                    axis.title.y = element_text(colour = "white"))+

    theme(strip.text = element_text(face = "bold", color = "white"))
}
