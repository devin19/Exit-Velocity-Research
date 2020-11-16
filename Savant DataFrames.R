#Run DK's Savant scrape functions to get total ball events for past 5 years

#2016
savnt_scrape_MarApr <- dkw_scrape_all(start_date = "2016-03-15", end_date = "2016-04-30")
savnt_scrape_May <- dkw_scrape_all(start_date = "2016-05-01", end_date = "2016-05-31")
savnt_scrape_June <- dkw_scrape_all(start_date = "2016-06-01", end_date = "2016-06-30")
savnt_scrape_July <- dkw_scrape_all(start_date = "2016-07-01", end_date = "2016-07-31")
savnt_scrape_Aug <- dkw_scrape_all(start_date = "2016-08-01", end_date = "2016-08-31")
savnt_scrape_Sept <- dkw_scrape_all(start_date = "2016-09-01", end_date = "2016-09-30")

total2016 <- do.call("rbind",list(savnt_scrape_MarApr,savnt_scrape_May,savnt_scrape_June,
                                  savnt_scrape_July,savnt_scrape_Aug,savnt_scrape_Sept))

#2017
savnt_scrape_MarApr <- dkw_scrape_all(start_date = "2017-03-15", end_date = "2017-04-30")
savnt_scrape_May <- dkw_scrape_all(start_date = "2017-05-01", end_date = "2017-05-31")
savnt_scrape_June <- dkw_scrape_all(start_date = "2017-06-01", end_date = "2017-06-30")
savnt_scrape_July <- dkw_scrape_all(start_date = "2017-07-01", end_date = "2017-07-31")
savnt_scrape_Aug <- dkw_scrape_all(start_date = "2017-08-01", end_date = "2017-08-31")
savnt_scrape_Sept <- dkw_scrape_all(start_date = "2017-09-01", end_date = "2017-09-30")

total2017 <- do.call("rbind",list(savnt_scrape_MarApr,savnt_scrape_May,savnt_scrape_June,
                                  savnt_scrape_July,savnt_scrape_Aug,savnt_scrape_Sept))

#2018
savnt_scrape_MarApr <- dkw_scrape_all(start_date = "2018-03-15", end_date = "2018-04-30")
savnt_scrape_May <- dkw_scrape_all(start_date = "2018-05-01", end_date = "2018-05-31")
savnt_scrape_June <- dkw_scrape_all(start_date = "2018-06-01", end_date = "2018-06-30")
savnt_scrape_July <- dkw_scrape_all(start_date = "2018-07-01", end_date = "2018-07-31")
savnt_scrape_Aug <- dkw_scrape_all(start_date = "2018-08-01", end_date = "2018-08-31")
savnt_scrape_Sept <- dkw_scrape_all(start_date = "2018-09-01", end_date = "2018-09-30")

total2018 <- do.call("rbind",list(savnt_scrape_MarApr,savnt_scrape_May,savnt_scrape_June,
                                  savnt_scrape_July,savnt_scrape_Aug,savnt_scrape_Sept))

#2019
savnt_scrape_MarApr <- dkw_scrape_all(start_date = "2019-03-15", end_date = "2019-04-30")
savnt_scrape_May <- dkw_scrape_all(start_date = "2019-05-01", end_date = "2019-05-31")
savnt_scrape_June <- dkw_scrape_all(start_date = "2019-06-01", end_date = "2019-06-30")
savnt_scrape_July <- dkw_scrape_all(start_date = "2019-07-01", end_date = "2019-07-31")
savnt_scrape_Aug <- dkw_scrape_all(start_date = "2019-08-01", end_date = "2019-08-31")
savnt_scrape_Sept <- dkw_scrape_all(start_date = "2019-09-01", end_date = "2019-09-30")

total2019 <- do.call("rbind",list(savnt_scrape_MarApr,savnt_scrape_May,
                                  savnt_scrape_June,savnt_scrape_July,savnt_scrape_Aug,savnt_scrape_Sept))

#2020
savnt_scrape_Jly20 <- dkw_scrape_all(start_date = "2020-07-01", end_date = "2020-07-31")
savnt_scrape_Aug20 <- dkw_scrape_all(start_date = "2020-08-01", end_date = "2020-8-31")
savnt_scrape_Sept20 <- dkw_scrape_all(start_date = "2020-09-01", end_date = "2020-09-27")

ytd2020 <- do.call("rbind",list(savnt_scrape_Jly20,savnt_scrape_Aug20,savnt_scrape_Sept20))
total2020 <- ytd2020

#Filter by Well-Hit Parameters and create DataFrames for rates
#2016
wh2016 <- total2016 %>% filter(launch_speed > 90 & launch_angle >= -10 & launch_angle <= 45)
wh2016$woba_value <- as.numeric(wh2016$woba_value)
wh2016$babip_value <- as.numeric(wh2016$babip_value)
wh2016$iso_value <- as.numeric(wh2016$iso_value)

#2017
wh2017 <- total2017 %>% filter(launch_speed > 90 & launch_angle >= -10 & launch_angle <= 45)

#2018
wh2018 <- total2018 %>% filter(launch_speed > 90 & launch_angle >= -10 & launch_angle <= 45)

#2019
wh2019 <- total2019 %>% filter(launch_speed > 90 & launch_angle >= -10 & launch_angle <= 45)
wh_rates2019 <- wh2019 %>% group_by(batter) %>% summarize(avgEV = mean(launch_speed, na.rm = TRUE), 
                                                                  avgLA = mean(launch_angle, na.rm = TRUE), 
                                                                  maxEV = max(launch_speed), 
                                                                  iso = mean(iso_value, na.rm = TRUE), 
                                                                  wOBA = mean(woba_value, na.rm = TRUE), .groups = 'drop')
wh_rates2019 <- wh_rates2019 %>% mutate_if(is.numeric, round, digits = 3)

wh_rates2019 <- merge(x = wh_rates2019, y = wh2019[, c('batter', 'player_name')], by = 'batter')
wh_rates2019 <- wh_rates2019[, c(1, 7, 2, 3, 4, 5, 6)]
wh_rates2019<- wh_rates2019[!duplicated(wh_rates2019$batter),]

events2019 <- data.frame(count(wh2019, batter))
events2019 <- rename(events2019, events = n)
wh_rates2019 <- inner_join(wh_rates2019, events2019, by = 'batter')
wh_rates2019 <- wh_rates2019[, c(1, 2, 8, 3, 4, 5, 6, 7)]

#2020
wh2020 <- total2020 %>% filter(launch_speed > 90 & launch_angle >= -10 & launch_angle <= 45)

#3 years
wh3years <- bind_rows(wh2020, wh2019, wh2018)

wh_rates3years <- wh3years %>% group_by(batter) %>% summarize(avgEV = mean(launch_speed, na.rm = TRUE), 
                                                                   avgLA = mean(launch_angle, na.rm = TRUE), 
                                                                   maxEV = max(launch_speed), 
                                                                   iso = mean(iso_value, na.rm = TRUE), 
                                                                   wOBA = mean(woba_value, na.rm = TRUE), .groups = 'drop')
wh_rates3years <- wh_rates3years %>% mutate_if(is.numeric, round, digits = 3)

wh_rates3years <- merge(x = wh_rates3years, y = wh3years[, c('batter', 'player_name')], by = 'batter')
wh_rates3years <- wh_rates3years[, c(1, 7, 2, 3, 4, 5, 6)]
wh_rates3years<- wh_rates3years[!duplicated(wh_rates3years$batter),]

events3years <- data.frame(count(wh3years, batter))
events3years <- rename(events3years, events = n)
wh_rates3years <- inner_join(wh_rates3years, events3years, by = 'batter')
wh_rates3years <- wh_rates3years[, c(1, 8, 2, 3, 4, 5, 6, 7)]

#5 years
wh5years <- bind_rows(wh3years, wh2017, wh2016)

wh_rates5years <- wh5years %>% group_by(batter) %>% summarize(avgEV = mean(launch_speed, na.rm = TRUE), 
                                                                   avgLA = mean(launch_angle, na.rm = TRUE), 
                                                                   maxEV = max(launch_speed), 
                                                                   iso = mean(iso_value, na.rm = TRUE), 
                                                                   wOBA = mean(woba_value, na.rm = TRUE), .groups = 'drop')
wh_rates5years <- wh_rates5years %>% mutate_if(is.numeric, round, digits = 3)

wh_rates5years <- merge(x = wh_rates5years, y = wh5years[, c('batter', 'player_name')], by = 'batter')
wh_rates5years <- wh_rates5years[, c(1, 7, 2, 3, 4, 5, 6)]
wh_rates5years<- wh_rates5years[!duplicated(wh_rates5years$batter),]

events5years <- data.frame(count(wh5years, batter))
events5years <- rename(events5years, events = n)
wh_rates5years <- inner_join(wh_rates5years, events5years, by = 'batter')
wh_rates5years <- wh_rates5years[, c(1, 2, 8, 3, 4, 5, 6, 7)]

