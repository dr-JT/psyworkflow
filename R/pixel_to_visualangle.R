#' Check which files will be uploaded to OSF
#'
#' Verify that the file/folder names and pattern strings specificed in
#' upload_to_osf(skip_files = c()) argument will only upload the files you want
#' to upload.
#'
#' @param pixels Pixel value to convert to visual angle.
#' @param monitor_res A vector of two integers representing the monitor
#'    resolution in pixels. e.g., c(1920, 1080).
#' @param monitor_diagonal_in The diagonal size of the monitor in inches.
#' @param viewing_distance The distance from the monitor to the viewer in cm.
#' @export

pixel_to_visualangle <- function(pixels, monitor_res, monitor_diagonal_in,
                                 viewing_distance) {

  # Convert monitor size from inches to cm
  monitor_diaganol_cm <- monitor_diagonal_in * 2.54

  # Calculate monitor width and height in pixels
  monitor_width_px <- monitor_res[1]
  monitor_height_px <- monitor_res[2]

  # Calculate the aspect ratio of the monitor
  aspect_ratio <- monitor_width_px / monitor_height_px

  # Calculate the physical width of the monitor using the Pythagorean theorem
  monitor_width_cm <- sqrt((monitor_diaganol_cm^2) / (1 + 1/(aspect_ratio^2)))

  # Calculate the size of one pixel
  pixel_size_cm <- monitor_width_cm / monitor_width_px

  # Convert the pixel size to cm
  pixels_as_cm <- pixels * pixel_size_cm

  # Calculate the visual angle in degrees
  visual_angle <-
    2 * atan(pixels_as_cm / (2 * viewing_distance)) * (180 / pi)

  return(visual_angle)
}
