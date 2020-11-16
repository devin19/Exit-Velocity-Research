r2_slope_fg_savant <- data.frame('regression' = c('wRC+ vs. AvgEV (Well-Hit) 2019', 
                                            'ISO vs. AvgEV (Well-Hit) 2019',
                                            'wRC+ vs. AvgEV (Overall) 2019',
                                            'ISO vs. AvgEV (Overall) 2019',
                                            'wRC+ vs. MaxEV 2019',
                                            'ISO vs. MaxEV 2019',
                                            'wRC+ vs. AvgEV (Well-Hit) 3 years', 
                                            'ISO vs. AvgEV (Well-Hit) 3 years',
                                            'wRC+ vs. AvgEV (Overall) 3 years',
                                            'ISO vs. AvgEV (Overall) 3 years',
                                            'wRC+ vs. MaxEV 3 years',
                                            'ISO vs. MaxEV 3 years',
                                            'wRC+ vs. AvgEV (Well-Hit) 5 years', 
                                            'ISO vs. AvgEV (Well-Hit) 5 years',
                                            'wRC+ vs. AvgEV (Overall) 5 years',
                                            'ISO vs. AvgEV (Overall) 5 years',
                                            'wRC+ vs. MaxEV 5 years',
                                            'ISO vs. MaxEV 5 years'), 
                            'r2' = c(r2(fg_savant2019, fg_savant2019$well_hitEV, fg_savant2019$`wRC+`),
                                     r2(fg_savant2019, fg_savant2019$well_hitEV, fg_savant2019$`f_iso`),
                                     r2(fg_savant2019, fg_savant2019$totalEV, fg_savant2019$`wRC+`),
                                     r2(fg_savant2019, fg_savant2019$totalEV, fg_savant2019$`f_iso`),
                                     r2(fg_savant2019, fg_savant2019$maxEV, fg_savant2019$`wRC+`),
                                     r2(fg_savant2019, fg_savant2019$maxEV, fg_savant2019$`f_iso`),
                                     r2(fg_savant3years, fg_savant3years$well_hitEV, fg_savant3years$`wRC+`),
                                     r2(fg_savant3years, fg_savant3years$well_hitEV, fg_savant3years$`f_iso`),
                                     r2(fg_savant3years, fg_savant3years$totalEV, fg_savant3years$`wRC+`),
                                     r2(fg_savant3years, fg_savant3years$totalEV, fg_savant3years$`f_iso`),
                                     r2(fg_savant3years, fg_savant3years$maxEV, fg_savant3years$`wRC+`),
                                     r2(fg_savant3years, fg_savant3years$maxEV, fg_savant3years$`f_iso`),
                                     r2(fg_savant5years, fg_savant5years$well_hitEV, fg_savant5years$`wRC+`),
                                     r2(fg_savant5years, fg_savant5years$well_hitEV, fg_savant5years$`f_iso`),
                                     r2(fg_savant5years, fg_savant5years$totalEV, fg_savant5years$`wRC+`),
                                     r2(fg_savant5years, fg_savant5years$totalEV, fg_savant5years$`f_iso`),
                                     r2(fg_savant5years, fg_savant5years$maxEV, fg_savant5years$`wRC+`),
                                     r2(fg_savant5years, fg_savant5years$maxEV, fg_savant5years$`f_iso`)),
                           'slope' = c(slope(fg_savant2019, fg_savant2019$well_hitEV, fg_savant2019$`wRC+`),
                                       slope(fg_savant2019, fg_savant2019$well_hitEV, fg_savant2019$`f_iso`),
                                       slope(fg_savant2019, fg_savant2019$totalEV, fg_savant2019$`wRC+`),
                                       slope(fg_savant2019, fg_savant2019$totalEV, fg_savant2019$`f_iso`),
                                       slope(fg_savant2019, fg_savant2019$maxEV, fg_savant2019$`wRC+`),
                                       slope(fg_savant2019, fg_savant2019$maxEV, fg_savant2019$`f_iso`),
                                       slope(fg_savant3years, fg_savant3years$well_hitEV, fg_savant3years$`wRC+`),
                                       slope(fg_savant3years, fg_savant3years$well_hitEV, fg_savant3years$`f_iso`),
                                       slope(fg_savant3years, fg_savant3years$totalEV, fg_savant3years$`wRC+`),
                                       slope(fg_savant3years, fg_savant3years$totalEV, fg_savant3years$`f_iso`),
                                       slope(fg_savant3years, fg_savant3years$maxEV, fg_savant3years$`wRC+`),
                                       slope(fg_savant3years, fg_savant3years$maxEV, fg_savant3years$`f_iso`),
                                       slope(fg_savant5years, fg_savant5years$well_hitEV, fg_savant5years$`wRC+`),
                                       slope(fg_savant5years, fg_savant5years$well_hitEV, fg_savant5years$`f_iso`),
                                       slope(fg_savant5years, fg_savant5years$totalEV, fg_savant5years$`wRC+`),
                                       slope(fg_savant5years, fg_savant5years$totalEV, fg_savant5years$`f_iso`),
                                       slope(fg_savant5years, fg_savant5years$maxEV, fg_savant5years$`wRC+`),
                                       slope(fg_savant5years, fg_savant5years$maxEV, fg_savant5years$`f_iso`)),
                           'time_frame' = c('2019',
                                            '2019',
                                            '2019',
                                            '2019',
                                            '2019',
                                            '2019',
                                            '3 years',
                                            '3 years',
                                            '3 years',
                                            '3 years',
                                            '3 years',
                                            '3 years',
                                            '5 years',
                                            '5 years',
                                            '5 years',
                                            '5 years',
                                            '5 years',
                                            '5 years'),
                           'x_variable' = c('Well-hit AvgEV',
                                            'Well-hit AvgEV',
                                            'Overall AvgEV',
                                            'Overall AvgEV',
                                            'Max AvgEV',
                                            'Max AvgEV',
                                            'Well-hit AvgEV',
                                            'Well-hit AvgEV',
                                            'Overall AvgEV',
                                            'Overall AvgEV',
                                            'Max AvgEV',
                                            'Max AvgEV',
                                            'Well-hit AvgEV',
                                            'Well-hit AvgEV',
                                            'Overall AvgEV',
                                            'Overall AvgEV',
                                            'Max AvgEV',
                                            'Max AvgEV'),
                           'y_variable' = c('wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO',
                                            'wRC+',
                                            'ISO'))

r2_slope_fg_savant$r2 <- as.numeric(r2_slope_fg_savant$r2)
r2_slope_fg_savant$slope <- as.numeric(r2_slope_fg_savant$slope)

# DF with just 2019 R^2 & Slope
r2_slope_fg_savant2019 <- r2_slope_fg_savant[c(1,2,3,4,5,6),]
row.names(r2_slope_fg_savant2019) <- NULL

# DF with just 3 year R^2 & Slope
r2_slope_fg_savant3years <- r2_slope_fg_savant[c(7,8,9,10,11,12),]
row.names(r2_slope_fg_savant3years) <- NULL

# DF with just 5 year R^2 & Slope
r2_slope_fg_savant5years <- r2_slope_fg_savant[c(13,14,15,16,17,18),]
row.names(r2_slope_fg_savant5years) <- NULL

# DF with just Well-hit AvgEV R^2 & Slope
r2_slope_well_hit_avgEV <- r2_slope_fg_savant[c(1,2,7,8,13,14),]
row.names(r2_slope_well_hit_avgEV) <- NULL

# DF with just Overall AvgEV R^2 & Slope
r2_slope_overall_avgEV <- r2_slope_fg_savant[c(3,4,9,10,15,16),]
row.names(r2_slope_overall_avgEV) <- NULL

# DF with just Max EV R^2 & Slope
r2_slope_maxEV <- r2_slope_fg_savant[c(5,6,11,12,17,18),]
row.names(r2_slope_maxEV) <- NULL

# DF with just wRC+
r2_slope_wrc <- r2_slope_fg_savant[c(1,3,5,7,9,11,13,15,17),]
row.names(r2_slope_wrc) <- NULL

# DF with just ISO
r2_slope_iso <- r2_slope_fg_savant[c(2,4,6,8,10,12,14,16,18),]
row.names(r2_slope_iso) <- NULL

# Bar chart with Well-hit AvgEV R^2
well_hit_regressions_vs_r2 <- ggplot(r2_slope_well_hit_avgEV, aes(regression, r2, fill = y_variable)) + geom_bar(stat = 'identity') + xlab('Average EV (Well-hit) Regressions') + ylab('R^2') + scale_x_discrete(labels = c('2019', '3years', '5years','2019', '3years', '5years'))
well_hit_regressions_vs_r2

# Bar chart with Overall AvgEV R^2
overall_regressions_vs_r2 <- ggplot(r2_slope_overall_avgEV, aes(regression, r2, fill = y_variable)) + geom_bar(stat = 'identity') + xlab('Average EV (Overall) Regressions') + ylab('R^2') + scale_x_discrete(labels = c('2019', '3years', '5years','2019', '3years', '5years'))
overall_regressions_vs_r2

# Bar chart with Max EV R^2
max_regressions_vs_r2 <- ggplot(r2_slope_maxEV, aes(regression, r2, fill = y_variable)) + geom_bar(stat = 'identity') + xlab('Max EV Regressions') + ylab('R^2') + scale_x_discrete(labels = c('2019', '3years', '5years','2019', '3years', '5years'))
max_regressions_vs_r2

# Bar chart with wRC+ R^2
wrc_regressions_vs_r2 <- ggplot(r2_slope_wrc, aes(regression, r2, fill = x_variable)) + geom_bar(stat = 'identity') + xlab('wRC+ Regressions') + ylab('R^2') + scale_x_discrete(labels = c('2019', '3years', '5years','2019', '3years', '5years', '2019', '3years', '5years'))
wrc_regressions_vs_r2

# Bar chart with ISO R^2
iso_regressions_vs_r2 <- ggplot(r2_slope_iso, aes(regression, r2, fill = x_variable)) + geom_bar(stat = 'identity') + xlab('ISO Regressions') + ylab('R^2') + scale_x_discrete(labels = c('2019', '3years', '5years','2019', '3years', '5years', '2019', '3years', '5years'))
iso_regressions_vs_r2

# Bar chart with wRC+ Slope
wrc_regressions_vs_slope <- ggplot(r2_slope_wrc, aes(regression, slope, fill = x_variable)) + geom_bar(stat = 'identity') + xlab('wRC+ Regressions') + ylab('Slope') + scale_x_discrete(labels = c('2019', '3years', '5years','2019', '3years', '5years', '2019', '3years', '5years'))
wrc_regressions_vs_slope

# Bar chart with 2019 R^2
regressions2019_vs_r2 <- ggplot(r2_slope_fg_savant2019, aes(regression, r2, fill = y_variable)) + geom_bar(stat = 'identity') + xlab('2019 Regressions') + ylab('R^2') + scale_x_discrete(labels = c('Overall AvgEV', 'Well-hit AvgEV', 'Max AvgEV','Overall AvgEV', 'Well-hit AvgEV', 'Max AvgEV'))
regressions2019_vs_r2

# Bar chart with 3 year R^2
regressions3years_vs_r2 <- ggplot(r2_slope_fg_savant3years, aes(regression, r2, fill = y_variable)) + geom_bar(stat = 'identity') + xlab('3-year Regressions') + ylab('R^2') + scale_x_discrete(labels = c('Overall AvgEV', 'Well-hit AvgEV', 'Max AvgEV','Overall AvgEV', 'Well-hit AvgEV', 'Max AvgEV'))
regressions3years_vs_r2

# Bar chart with 5 year R^2
regressions5years_vs_r2 <- ggplot(r2_slope_fg_savant5years, aes(regression, r2, fill = y_variable)) + geom_bar(stat = 'identity') + xlab('5-year Regressions') + ylab('R^2') + scale_x_discrete(labels = c('Overall AvgEV', 'Well-hit AvgEV', 'Max AvgEV','Overall AvgEV', 'Well-hit AvgEV', 'Max AvgEV'))
regressions5years_vs_r2
