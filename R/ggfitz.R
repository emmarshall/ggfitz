#' Key fitz
#' @param data,params,size key stuff
#' @importFrom ggplot2 ggproto layer
#' @importFrom grid rasterGrob
#' @importFrom png readPNG
#' @importFrom grDevices as.raster
draw_key_fitz <-  function(data, params, size) {
  filename <- system.file(paste0(data$fitz, ".png"), package = "ggfitz", mustWork = TRUE)
  img <- as.raster(png::readPNG(filename))  # Corrected namespace usage
  aspect <- dim(img)[1]/dim(img)[2]
  grid::rasterGrob(image = img)
}

# fitzGrob
fitzGrob <- function(x, y, size, fitz = "fitz", geom_key = list(
  fitz = "fitz.png",
  smart = "smart.png",
  student = "student.png",
  sleep = "sleep.png",
  shade = "shade.png",
  cool = "cool.png",
  captain = "captain.png"
)) {
  filename <- system.file(geom_key[[unique(fitz)]], package = "ggfitz", mustWork = TRUE)
  if (filename == "") {
    stop(paste("File not found:", geom_key[[unique(fitz)]]))
  }
  img <- as.raster(png::readPNG(filename))
  
  # rasterGrob
  grid::rasterGrob(x = x,
                   y = y,
                   image = img,
                   # only set height so that the width scales proportionally and so that the icon
                   # stays the same size regardless of the dimensions of the plot
                   height = size * ggplot2::unit(20, "mm"))
}

# Geomfitz
Geomfitz <- ggplot2::ggproto(`_class` = "Geomfitz",
                               `_inherit` = ggplot2::Geom,
                               required_aes = c("x", "y"),
                               non_missing_aes = c("size", "fitz"),
                               default_aes = ggplot2::aes(size = 1, fitz = "fitz", shape  = 19,
                                                          colour = "black",   fill   = NA,
                                                          alpha  = NA,
                                                          stroke =  0.5,
                                                          scale = 5,
                                                          image_filename = "fitz"),

                               draw_panel = function(data, panel_scales, coord, na.rm = FALSE) {
                                 coords <- coord$transform(data, panel_scales)
                                 ggplot2:::ggname(prefix = "geom_fitz",
                                                  grob = fitzGrob(x = coords$x,
                                                                    y = coords$y,
                                                                    size = coords$size,
                                                                    fitz = coords$fitz))
                               },

                               draw_key = draw_key_fitz)

#' @title fitz layer
#' @description The geom is used to add cute fitz images to plots. See ?ggplot2::geom_points for more info.
#' @inheritParams ggplot2::geom_point
#' @examples
#'
#' # install.packages("ggplot2")
#'library(ggplot2)
#' ggplot(mtcars) +
#'   geom_fitz(aes(mpg, wt), fitz = "fitz") +
#'   theme_bw()
#' 
#' ggplot(mtcars) +
#'   geom_fitz(aes(mpg, wt), fitz = "smart") +  # Corrected to use 'smart' which is defined
#'   theme_bw()
#'
#' @importFrom grDevices as.raster
#' @export
geom_fitz <- function(mapping = NULL,
                        data = NULL,
                        stat = "identity",
                        position = "identity",
                        ...,
                        na.rm = FALSE,
                        show.legend = NA,
                        inherit.aes = TRUE) {

  ggplot2::layer(data = data,
                 mapping = mapping,
                 stat = stat,
                 geom = Geomfitz,
                 position = position,
                 show.legend = show.legend,
                 inherit.aes = inherit.aes,
                 params = list(na.rm = na.rm, ...))
}




