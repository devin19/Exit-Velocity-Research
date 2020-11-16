#Import Data with Player IDs from all sources
masterPTemp <- read.csv("http://crunchtimebaseball.com/master.csv",stringsAsFactors = F)
masterP <- masterPTemp %>% select(mlb_id,fg_id) %>% rename(playerid="fg_id",batter="mlb_id")

#2019
fg_merge2019<- merge(masterP, fangraphs2019, by='playerid')
fg_savant2019 <- merge(fg_merge2019, wh_rates2019, by='batter')

fg_savant2019 <- rename(fg_savant2019, total_events = Events, totalEV = EV, totalLA = LA, 
                        hard_hit_num = HardHit, hard_hit_rate = 'HardHit%', f_iso = ISO, 
                        f_woba = wOBA.x, well_hit_events = events, well_hitEV = avgEV, well_hitLA = avgLA, 
                        well_hit_iso = iso, well_hit_woba = wOBA.y)
fg_savant2019 <- subset(fg_savant2019, select = -c(player_name) )

fg_savant2019$EV_diff <- (fg_savant2019$well_hitEV - fg_savant2019$totalEV)

fg_savant2019$totalEV_vs_avg <- (fg_savant2019$totalEV - mean(fg_savant2019$totalEV))
fg_savant2019$totalEV_vs_avg <- round(fg_savant2019$totalEV_vs_avg, 3)

fg_savant2019$wellhitEV_vs_avg <- (fg_savant2019$well_hitEV - mean(fg_savant2019$well_hitEV))
fg_savant2019$wellhitEV_vs_avg <- round(fg_savant2019$wellhitEV_vs_avg, 3)

#3 years
fg_merge3years <- merge(masterP, fangraphs_3years, by='playerid')
fg_savant3years <- merge(fg_merge3years, wh_rates3years, by='batter')

fg_savant3years<- rename(fg_savant3years, total_events = Events, totalEV = EV, totalLA = LA, 
                         hard_hit_num = HardHit, hard_hit_rate = 'HardHit%', f_iso = ISO, 
                         f_woba = wOBA.x, well_hit_events = events, well_hitEV = avgEV, well_hitLA = avgLA, 
                         well_hit_iso = iso, well_hit_woba = wOBA.y)
fg_savant3years <- subset(fg_savant3years, select = -c(player_name) )

fg_savant3years$EV_diff <- (fg_savant3years$well_hitEV - fg_savant3years$totalEV)

fg_savant3years$totalEV_vs_avg <- (fg_savant3years$totalEV - mean(fg_savant3years$totalEV))
fg_savant3years$totalEV_vs_avg <- round(fg_savant3years$totalEV_vs_avg, 3)

fg_savant3years$wellhitEV_vs_avg <- (fg_savant3years$well_hitEV - mean(fg_savant3years$well_hitEV))
fg_savant3years$wellhitEV_vs_avg <- round(fg_savant3years$wellhitEV_vs_avg, 3)

#5 years
fg_merge5years <- merge(masterP, fangraphs_5years, by='playerid')
fg_savant5years <- merge(fg_merge5years, wh_rates5years, by='batter')

fg_savant5years<- rename(fg_savant5years, total_events = Events, totalEV = EV, totalLA = LA, 
                         hard_hit_num = HardHit, hard_hit_rate = 'HardHit%', f_iso = ISO, 
                         f_woba = wOBA.x, well_hit_events = events, well_hitEV = avgEV, well_hitLA = avgLA, 
                         well_hit_iso = iso, well_hit_woba = wOBA.y)
fg_savant5years <- subset(fg_savant5years, select = -c(player_name) )

fg_savant5years$EV_diff <- (fg_savant5years$well_hitEV - fg_savant5years$totalEV)

fg_savant5years$totalEV_vs_avg <- (fg_savant5years$totalEV - mean(fg_savant5years$totalEV))
fg_savant5years$totalEV_vs_avg <- round(fg_savant5years$totalEV_vs_avg, 3)

fg_savant5years$wellhitEV_vs_avg <- (fg_savant5years$well_hitEV - mean(fg_savant5years$well_hitEV))
fg_savant5years$wellhitEV_vs_avg <- round(fg_savant5years$wellhitEV_vs_avg, 3)

