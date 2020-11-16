setwd("~/R/Projects")

library(Lahman)
library(retrosheet)
library(readr)
library(dplyr)
library(baseballr)
library(readxl)

#Enter player ID (Betts-605141, Votto-458015)
#Batter_id_enter <- 605141

#savant18ytd <- read.csv("savant_scrape_May_2018.csv")


dkw_scrape_player <- function (start_date, end_date, batterid)
{
  if (!is.character(start_date) | !is.character(end_date)) {
    warning("Please wrap your dates in quotations in 'yyyy-mm-dd' format.")
    return(NULL)
  }
  if (as.Date(start_date) <= "2015-03-01") {
    message("Some metrics such as Exit Velocity and Batted Ball Events have only been compiled since 2015.")
  }
  if (as.Date(start_date) <= "2008-03-25") {
    stop("The data are limited to the 2008 MLB season and after.")
    return(NULL)
  }
  if (as.Date(start_date) == Sys.Date()) {
    message("The data are collected daily at 3 a.m. Some of today's games may not be included.")
  }
  if (as.Date(start_date) > as.Date(end_date)) {
    stop("The start date is later than the end date.")
    return(NULL)
  }
  year <- substr(start_date, 1, 4)
  url <- paste0("https://baseballsavant.mlb.com/statcast_search/csv?all=true&hfPT=&hfAB=&hfBBT=&hfPR=hit%5C.%5C.into%5C.%5C.play%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.no%5C.%5C.out%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.score%7C=&hfZ=&stadium=&hfBBL=&hfNewZones=&hfGT=R%7CPO%7CS%7C&hfC=&hfSea=",
                year, "%7C&hfSit=&player_type=batter&hfOuts=&opponent=&pitcher_throws=&batter_stands=&hfSA=&game_date_gt=",
                start_date, "&game_date_lt=", end_date, "&batters_lookup%5B%5D=",
                batterid, "&team=&position=&hfRO=&home_road=&hfFlag=&metric_1=&hfInn=&min_pitches=0&min_results=0&group_by=name&sort_col=pitches&player_event_sort=h_launch_speed&sort_order=desc&min_abs=0&type=details&")
  
  # =&hfPR=hit%5C.%5C.into%5C.%5C.play%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.no%5C.%5C.out%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.score%7C&hfZ=&stadium
  
  
  tryCatch({
    print("These data are from BaseballSavant and are property of MLB Advanced Media, L.P. All rights reserved.")
    print("Grabbing data, this may take a minute...")
    payload <- utils::read.csv(url)
  }, error = function(cond) {
    message(paste("URL does not seem to exist, please check your Internet connection:"))
    message("Original error message:")
    message(cond)
    return(NA)
  }, warning = function(cond) {
    message(paste("URL caused a warning. Make sure your batterid and date range are correct:"))
    message("Original warning message:")
    message(cond)
    return(NULL)
  })
  payload[payload == "null"] <- NA
  payload$game_date <- as.Date(payload$game_date, "%Y-%m-%d")
  payload$des <- as.character(payload$des)
  payload$game_pk <- as.character(payload$game_pk) %>% as.numeric()
  payload$on_1b <- as.character(payload$on_1b) %>% as.numeric()
  payload$on_2b <- as.character(payload$on_2b) %>% as.numeric()
  payload$on_3b <- as.character(payload$on_3b) %>% as.numeric()
  payload$release_pos_x <- as.character(payload$release_pos_x) %>%
    as.numeric()
  payload$release_pos_x <- as.character(payload$release_pos_x) %>%
    as.numeric()
  payload$hit_distance_sc <- as.character(payload$hit_distance_sc) %>%
    as.numeric()
  payload$launch_speed <- as.character(payload$launch_speed) %>%
    as.numeric()
  payload$launch_angle <- as.character(payload$launch_angle) %>%
    as.numeric()
  payload$effective_speed <- as.character(payload$effective_speed) %>%
    as.numeric()
  payload$release_spin_rate <- as.character(payload$release_spin_rate) %>%
    as.numeric()
  payload$release_extension <- as.character(payload$release_extension) %>%
    as.numeric()
  payload$pitch_name <- as.character(payload$pitch_name)
  payload$home_score <- as.character(payload$home_score) %>%
    as.numeric()
  payload$away_score <- as.character(payload$away_score) %>%
    as.numeric()
  payload$bat_score <- as.character(payload$bat_score) %>%
    as.numeric()
  payload$fld_score <- as.character(payload$fld_score) %>%
    as.numeric()
  payload$post_away_score <- as.character(payload$post_away_score) %>%
    as.numeric()
  payload$post_home_score <- as.character(payload$post_home_score) %>%
    as.numeric()
  payload$post_bat_score <- as.character(payload$post_bat_score) %>%
    as.numeric()
  payload$post_fld_score <- as.character(payload$post_fld_score) %>%
    as.numeric()
  payload$barrel <- with(payload, ifelse(launch_angle <= 50 &
                                           launch_speed >= 98 & launch_speed * 1.5 - launch_angle >=
                                           11 & launch_speed + launch_angle >= 124, 1, 0))
  message("URL read and payload aquired successfully.")
  return(payload)
}



#Scrape all limiting data by hit balls only
dkw_scrape_all <- function (start_date, end_date)
{
  if (!is.character(start_date) | !is.character(end_date)) {
    warning("Please wrap your dates in quotations in 'yyyy-mm-dd' format.")
    return(NULL)
  }
  if (as.Date(start_date) <= "2015-03-01") {
    message("Some metrics such as Exit Velocity and Batted Ball Events have only been compiled since 2015.")
  }
  if (as.Date(start_date) <= "2008-03-25") {
    stop("The data are limited to the 2008 MLB season and after.")
    return(NULL)
  }
  if (as.Date(start_date) == Sys.Date()) {
    message("The data are collected daily at 3 a.m. Some of today's games may not be included.")
  }
  if (as.Date(start_date) > as.Date(end_date)) {
    stop("The start date is later than the end date.")
    return(NULL)
  }
  year <- substr(start_date, 1, 4)
  url <- paste0("https://baseballsavant.mlb.com/statcast_search/csv?all=true&hfPT=&hfAB=&hfBBT=&hfPR=hit%5C.%5C.into%5C.%5C.play%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.no%5C.%5C.out%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.score%7C&hfZ=&stadium=&hfBBL=&hfNewZones=&hfGT=R%7CPO%7CS%7C&hfC=&hfSea=",
                year, "%7C&hfSit=&player_type=batter&hfOuts=&opponent=&pitcher_throws=&batter_stands=&hfSA=&game_date_gt=",
                start_date, "&game_date_lt=", end_date, "&team=&position=&hfRO=&home_road=&hfFlag=&metric_1=&hfInn=&min_pitches=0&min_results=0&group_by=name&sort_col=pitches&player_event_sort=h_launch_speed&sort_order=desc&min_abs=0&type=details&")
  
  #Add this into string for contacted balls only
  #=&hfPR=hit%5C.%5C.into%5C.%5C.play%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.no%5C.%5C.out%7Chit%5C.%5C.into%5C.%5C.play%5C.%5C.score%7C&hfZ=&stadium
  
  
  tryCatch({
    print("These data are from BaseballSavant and are property of MLB Advanced Media, L.P. All rights reserved.")
    print("Grabbing data, this may take a minute...")
    payload <- utils::read.csv(url)
  }, error = function(cond) {
    message(paste("URL does not seem to exist, please check your Internet connection:"))
    message("Original error message:")
    message(cond)
    return(NA)
  }, warning = function(cond) {
    message(paste("URL caused a warning. Make sure your date range is correct:"))
    message("Original warning message:")
    message(cond)
    return(NULL)
  })
  payload[payload == "null"] <- NA
  payload$game_date <- as.Date(payload$game_date, "%Y-%m-%d")
  payload$des <- as.character(payload$des)
  payload$game_pk <- as.character(payload$game_pk) %>% as.numeric()
  payload$on_1b <- as.character(payload$on_1b) %>% as.numeric()
  payload$on_2b <- as.character(payload$on_2b) %>% as.numeric()
  payload$on_3b <- as.character(payload$on_3b) %>% as.numeric()
  payload$release_pos_x <- as.character(payload$release_pos_x) %>%
    as.numeric()
  payload$release_pos_x <- as.character(payload$release_pos_x) %>%
    as.numeric()
  payload$hit_distance_sc <- as.character(payload$hit_distance_sc) %>%
    as.numeric()
  payload$launch_speed <- as.character(payload$launch_speed) %>%
    as.numeric()
  payload$launch_angle <- as.character(payload$launch_angle) %>%
    as.numeric()
  payload$effective_speed <- as.character(payload$effective_speed) %>%
    as.numeric()
  payload$release_spin_rate <- as.character(payload$release_spin_rate) %>%
    as.numeric()
  payload$release_extension <- as.character(payload$release_extension) %>%
    as.numeric()
  payload$pitch_name <- as.character(payload$pitch_name)
  payload$home_score <- as.character(payload$home_score) %>%
    as.numeric()
  payload$away_score <- as.character(payload$away_score) %>%
    as.numeric()
  payload$bat_score <- as.character(payload$bat_score) %>%
    as.numeric()
  payload$fld_score <- as.character(payload$fld_score) %>%
    as.numeric()
  payload$post_away_score <- as.character(payload$post_away_score) %>%
    as.numeric()
  payload$post_home_score <- as.character(payload$post_home_score) %>%
    as.numeric()
  payload$post_bat_score <- as.character(payload$post_bat_score) %>%
    as.numeric()
  payload$post_fld_score <- as.character(payload$post_fld_score) %>%
    as.numeric()
  payload$barrel <- with(payload, ifelse(launch_angle <= 50 &
                                           launch_speed >= 98 & launch_speed * 1.5 - launch_angle >=
                                           11 & launch_speed + launch_angle >= 124, 1, 0))
  message("URL read and payload acquired successfully.")
  return(payload)
}

#Month-to-date 2020
savnt_scrape_Jly20 <- dkw_scrape_all(start_date = "2020-07-01", end_date = "2020-07-31")
savnt_scrape_Aug20 <- dkw_scrape_all(start_date = "2020-08-01", end_date = "2020-8-31")
savnt_scrape_Sept20 <- dkw_scrape_all(start_date = "2020-09-01", end_date = "2020-09-27")

total2020 <- do.call("rbind",list(savnt_scrape_Jly20,savnt_scrape_Aug20,savnt_scrape_Sept20))

#2019
savnt_scrape_MarApr <- dkw_scrape_all(start_date = "2019-03-15", end_date = "2019-04-30")
savnt_scrape_May <- dkw_scrape_all(start_date = "2019-05-01", end_date = "2019-05-31")
savnt_scrape_June <- dkw_scrape_all(start_date = "2019-06-01", end_date = "2019-06-30")
savnt_scrape_July <- dkw_scrape_all(start_date = "2019-07-01", end_date = "2019-07-31")
savnt_scrape_Aug <- dkw_scrape_all(start_date = "2019-08-01", end_date = "2019-08-31")
savnt_scrape_Sept <- dkw_scrape_all(start_date = "2019-09-01", end_date = "2019-09-30")

total2019 <- do.call("rbind",list(savnt_scrape_MarApr,savnt_scrape_May,savnt_scrape_June,savnt_scrape_July,savnt_scrape_Aug,savnt_scrape_Sept))
