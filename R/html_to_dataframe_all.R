#' Parse multiple Ethnic NewsWatch search result (saved in HTML format) into a dataframe
#'
#' @param dir_path A directory path where a user saved the HTML files containing the search results from the Ethnic NewsWatch database. This input should be a string vector.
#' @return A dataframe with four columns ("text", "source", "author", "date", "title")
#' @importFrom dplyr full_join
#' @importFrom furrr future_map_dfr
#' @export

html_to_dataframe_all <- function(dir_path) {

  # Load all HTML files in the designated file path
  filename <- list.files(dir_path,
    pattern = "*.html",
    full.names = TRUE
  )

  df <- filename %>%
    # Apply html_to_dataframe function to items on the list
    future_map_dfr(~ html_to_dataframe(.),
      .progress = TRUE
    )
  # Output
  return(df)
}
