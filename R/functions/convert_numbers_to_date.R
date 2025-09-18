convert_to_date_time = function(df, date_time_cols){
  df[date_time_cols] = lapply(df[date_time_cols], \(x) x |> as.Date(origin = "1899-12-30") |> lubridate::as_datetime())
  return(df)
}

convert_to_date = function(df, date_cols){
  df[date_cols] = lapply(df[date_cols], \(x) x |> as.Date(origin = "1899-12-30") |> lubridate::as_date())
  return(df)
}

convert_to_time = function(df, time_cols){
  df[time_cols] <- lapply(df[time_cols], \(x) x |> as.Date(origin = "1899-12-30") |> as_datetime() |> format("%H:%M:%S"))
  # df[time_cols] <- lapply(df[time_cols], \(x) x |> as.Date(origin = "1899-12-30") |>  as.POSIXct() |> format("%H:%M:%S"))
  return(df)
}