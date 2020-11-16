# 1 YEAR
#1 year Avg WH EV vs. wRC+
well_hit_avg_wrc2019 <- ggplot(fg_savant2019, aes(well_hitEV, `wRC+`)) + geom_point() + xlab('Average EV (Well-hit)') + ylab('wRC+')
well_hit_avg_wrc2019 <- well_hit_avg_wrc2019 + geom_smooth() + geom_text_repel(data = filter(fg_savant2019, `wRC+` > 170 | `wRC+` < 75), aes(well_hitEV, `wRC+`, label = Name))
well_hit_avg_wrc2019
well_hit_avg_wrc2019 <- well_hit_avg_wrc2019 + geom_text(x = 97.5, y = 175, label = lm_eqn(fg_savant2019, fg_savant2019$well_hitEV, fg_savant2019$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. Well-Hit AvgEV (2019)')
well_hit_avg_wrc2019

#1 year Avg WH EV vs. ISO
well_hit_avg_iso2019 <- ggplot(fg_savant2019, aes(well_hitEV, `f_iso`)) + geom_point() + xlab('Average EV (Well-hit)') + ylab('ISO')
well_hit_avg_iso2019 <- well_hit_avg_iso2019 + geom_smooth() + geom_text_repel(data = filter(fg_savant2019, `f_iso` > .33 | `f_iso` < .1), aes(well_hitEV, `f_iso`, label = Name))
well_hit_avg_iso2019
well_hit_avg_iso2019 <- well_hit_avg_iso2019 + geom_text(x = 97.5, y = .35, label = lm_eqn(fg_savant2019, fg_savant2019$well_hitEV, fg_savant2019$`f_iso`), parse = TRUE) + ggtitle('ISO vs. Well-Hit AvgEV (2019)')
well_hit_avg_iso2019

#1 year Total Avg EV vs. wRC+
overall_avg_wrc2019 <- ggplot(fg_savant2019, aes(totalEV, `wRC+`)) + geom_point() + xlab('Average EV (Overall)') + ylab('wRC+')
overall_avg_wrc2019 <- overall_avg_wrc2019 + geom_smooth() + geom_text_repel(data = filter(fg_savant2019, `wRC+` > 170 | `wRC+` < 75), aes(totalEV, `wRC+`, label = Name))
overall_avg_wrc2019
overall_avg_wrc2019 <- overall_avg_wrc2019 + geom_text(x = 86, y = 180, label = lm_eqn(fg_savant2019, fg_savant2019$totalEV, fg_savant2019$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. Overall AvgEV (2019)')
overall_avg_wrc2019

#1 year Total Avg EV vs. ISO
overall_avg_iso2019 <- ggplot(fg_savant2019, aes(totalEV, `f_iso`)) + geom_point() + xlab('Average EV (Overall)') + ylab('ISO')
overall_avg_iso2019 <- overall_avg_iso2019 + geom_smooth() + geom_text_repel(data = filter(fg_savant2019, `f_iso` > .33 | `f_iso` < .1), aes(totalEV, `f_iso`, label = Name))
overall_avg_iso2019
overall_avg_iso2019 <- overall_avg_iso2019 + geom_text(x = 86, y = .35, label = lm_eqn(fg_savant2019, fg_savant2019$totalEV, fg_savant2019$`f_iso`), parse = TRUE) + ggtitle('ISO vs. Overall AvgEV (2019)')
overall_avg_iso2019

#1 year Max EV vs. wRC+
max_wrc2019 <- ggplot(fg_savant2019, aes(maxEV, `wRC+`)) + geom_point() + xlab('Max EV') + ylab('wRC+')
max_wrc2019 <- max_wrc2019 + geom_smooth() + geom_text_repel(data = filter(fg_savant2019, `wRC+` > 165 | `wRC+` < 75), aes(maxEV, `wRC+`, label = Name))
max_wrc2019
max_wrc2019 <- max_wrc2019 + geom_text(x = 108, y = 180, label = lm_eqn(fg_savant2019, fg_savant2019$maxEV, fg_savant2019$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. MaxEV (2019)')
max_wrc2019

#1 year Max EV vs. ISO
max_iso2019 <- ggplot(fg_savant2019, aes(maxEV, `f_iso`)) + geom_point() + xlab('Max EV') + ylab('ISO')
max_iso2019 <- max_iso2019 + geom_smooth() + geom_text_repel(data = filter(fg_savant2019, `f_iso` > .33 | `f_iso` < .1), aes(maxEV, `f_iso`, label = Name))
max_iso2019
max_iso2019 <- max_iso2019 + geom_text(x = 108, y = .35, label = lm_eqn(fg_savant2019, fg_savant2019$maxEV, fg_savant2019$`f_iso`), parse = TRUE) + ggtitle('ISO vs. MaxEV (2019)')
max_iso2019

#1 year EV Diff vs. wRC+
ev_diff_wrc2019 <- ggplot(fg_savant2019, aes(EV_diff, `wRC+`)) + geom_point() + xlab('Difference between AvgEV and Well-HitEV') + ylab('wRC+')
ev_diff_wrc2019 <- ev_diff_wrc2019 + geom_smooth() + geom_text_repel(data = filter(fg_savant2019, `wRC+` > 165 | `wRC+` < 75), aes(EV_diff, `wRC+`, label = Name))
ev_diff_wrc2019
ev_diff_wrc2019 <- ev_diff_wrc2019 + geom_text(x = 14, y = 165, label = lm_eqn(fg_savant2019, fg_savant2019$EV_diff, fg_savant2019$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. EV Difference (2019)')
ev_diff_wrc2019

# 3 YEARS
#3 year Avg WH EV vs. wRC+
well_hit_avg_wrc3years <- ggplot(fg_savant3years, aes(well_hitEV, `wRC+`)) + geom_point() + xlab('Average EV (Well-hit)') + ylab('wRC+')
well_hit_avg_wrc3years <- well_hit_avg_wrc3years + geom_smooth() + geom_text_repel(data = filter(fg_savant3years, `wRC+` > 158 | `wRC+` < 75), aes(well_hitEV, `wRC+`, label = Name))
well_hit_avg_wrc3years
well_hit_avg_wrc3years <- well_hit_avg_wrc3years + geom_text(x = 97.5, y = 175, label = lm_eqn(fg_savant3years, fg_savant3years$well_hitEV, fg_savant3years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. Well-Hit AvgEV (3 years)')
well_hit_avg_wrc3years

#3 year Avg WH EV vs. ISO
well_hit_avg_iso3years <- ggplot(fg_savant3years, aes(well_hitEV, `f_iso`)) + geom_point() + xlab('Average EV (Well-hit)') + ylab('ISO')
well_hit_avg_iso3years <- well_hit_avg_iso3years + geom_smooth() + geom_text_repel(data = filter(fg_savant3years, `f_iso` > .290 | `f_iso` < .085), aes(well_hitEV, `f_iso`, label = Name))
well_hit_avg_iso3years
well_hit_avg_iso3years <- well_hit_avg_iso3years + geom_text(x = 97.5, y = .3, label = lm_eqn(fg_savant3years, fg_savant3years$well_hitEV, fg_savant3years$`f_iso`), parse = TRUE) + ggtitle('ISO vs. Well-Hit AvgEV (3 years)')
well_hit_avg_iso3years

#3 year Total Avg EV vs. wRC+
overall_avg_wrc3years <- ggplot(fg_savant3years, aes(totalEV, `wRC+`)) + geom_point() + xlab('Average EV (Overall)') + ylab('wRC+')
overall_avg_wrc3years <- overall_avg_wrc3years + geom_smooth() + geom_text_repel(data = filter(fg_savant3years, `wRC+` > 158 | `wRC+` < 75), aes(totalEV, `wRC+`, label = Name))
overall_avg_wrc3years
overall_avg_wrc3years <- overall_avg_wrc3years + geom_text(x = 86, y = 175, label = lm_eqn(fg_savant3years, fg_savant3years$totalEV, fg_savant3years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. Overall AvgEV (3 years)')
overall_avg_wrc3years

#3 year Total Avg EV vs. ISO
overall_avg_iso3years <- ggplot(fg_savant3years, aes(totalEV, `f_iso`)) + geom_point() + xlab('Average EV (Overall)') + ylab('ISO')
overall_avg_iso3years <- overall_avg_iso3years + geom_smooth() + geom_text_repel(data = filter(fg_savant3years, `f_iso` > .290 | `f_iso` < .085), aes(totalEV, `f_iso`, label = Name))
overall_avg_iso3years
overall_avg_iso3years <- overall_avg_iso3years + geom_text(x = 86, y = .3, label = lm_eqn(fg_savant3years, fg_savant3years$totalEV, fg_savant3years$`f_iso`), parse = TRUE) + ggtitle('ISO vs. Overall AvgEV (3 years)')
overall_avg_iso3years

#3 year Max EV vs. wRC+
max_wrc3years <- ggplot(fg_savant3years, aes(maxEV, `wRC+`)) + geom_point() + xlab('Max EV') + ylab('wRC+')
max_wrc3years <- max_wrc3years + geom_smooth() + geom_text_repel(data = filter(fg_savant3years, `wRC+` > 158 | `wRC+` < 75), aes(maxEV, `wRC+`, label = Name))
max_wrc3years
max_wrc3years <- max_wrc3years + geom_text(x = 108, y = 180, label = lm_eqn(fg_savant3years, fg_savant3years$maxEV, fg_savant3years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. MaxEv (3 years)')
max_wrc3years

#3 year Max EV vs. ISO
max_iso3years <- ggplot(fg_savant3years, aes(maxEV, `f_iso`)) + geom_point() + xlab('Max EV') + ylab('ISO')
max_iso3years <- max_iso3years + geom_smooth() + geom_text_repel(data = filter(fg_savant3years, `f_iso` > .290 | `f_iso` < .085), aes(maxEV, `f_iso`, label = Name))
max_iso3years
max_iso3years <- max_iso3years + geom_text(x = 108, y = .35, label = lm_eqn(fg_savant3years, fg_savant3years$maxEV, fg_savant3years$`f_iso`), parse = TRUE) + ggtitle('ISO vs. MaxEV (3 years)')
max_iso3years

#3 year EV Diff vs. wRC+
ev_diff_wrc3years <- ggplot(fg_savant3years, aes(EV_diff, `wRC+`)) + geom_point() + xlab('Difference between AvgEV and Well-HitEV') + ylab('wRC+')
ev_diff_wrc3years <- ev_diff_wrc3years + geom_smooth() + geom_text_repel(data = filter(fg_savant3years, `wRC+` > 158 | `wRC+` < 75), aes(EV_diff, `wRC+`, label = Name))
ev_diff_wrc3years
ev_diff_wrc3years <- ev_diff_wrc3years + geom_text(x = 9.5, y = 170, label = lm_eqn(fg_savant3years, fg_savant3years$EV_diff, fg_savant3years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. EV Difference (3 years)')
ev_diff_wrc3years


# 5 YEARS
#5 year Avg WH EV vs. wRC+
well_hit_avg_wrc5years <- ggplot(fg_savant5years, aes(well_hitEV, `wRC+`)) + geom_point() + xlab('Average EV (Well-hit)') + ylab('wRC+')
well_hit_avg_wrc5years <- well_hit_avg_wrc5years + geom_smooth() + geom_text_repel(data = filter(fg_savant5years, `wRC+` > 150 | `wRC+` < 67), aes(well_hitEV, `wRC+`, label = Name))
well_hit_avg_wrc5years
well_hit_avg_wrc5years <- well_hit_avg_wrc5years + geom_text(x = 97.5, y = 175, label = lm_eqn(fg_savant5years, fg_savant5years$well_hitEV, fg_savant5years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. Well-Hit AvgEV (5 years)')
well_hit_avg_wrc5years

#5 year Avg WH EV vs. ISO
well_hit_avg_iso5years <- ggplot(fg_savant5years, aes(well_hitEV, `f_iso`)) + geom_point() + xlab('Average EV (Well-hit)') + ylab('ISO')
well_hit_avg_iso5years <- well_hit_avg_iso5years + geom_smooth() + geom_text_repel(data = filter(fg_savant5years, `f_iso` > .295 | `f_iso` < .085), aes(well_hitEV, `f_iso`, label = Name))
well_hit_avg_iso5years
well_hit_avg_iso5years <- well_hit_avg_iso5years + geom_text(x = 97.5, y = .3, label = lm_eqn(fg_savant5years, fg_savant5years$well_hitEV, fg_savant5years$`f_iso`), parse = TRUE) + ggtitle('ISO vs. Well-Hit AvgEV (5 years)')
well_hit_avg_iso5years

#5 year Total Avg EV vs. wRC+
overall_avg_wrc5years <- ggplot(fg_savant5years, aes(totalEV, `wRC+`)) + geom_point() + xlab('Average EV (Overall)') + ylab('wRC+')
overall_avg_wrc5years <- overall_avg_wrc5years + geom_smooth() + geom_text_repel(data = filter(fg_savant5years, `wRC+` > 150 | `wRC+` < 67), aes(totalEV, `wRC+`, label = Name))
overall_avg_wrc5years
overall_avg_wrc5years <- overall_avg_wrc5years + geom_text(x = 85, y = 165, label = lm_eqn(fg_savant5years, fg_savant5years$totalEV, fg_savant5years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. Overall AvgEV (5 years)')
overall_avg_wrc5years

#5 year Total Avg EV vs. ISO
overall_avg_iso5years <- ggplot(fg_savant5years, aes(totalEV, `f_iso`)) + geom_point() + xlab('Average EV (Overall)') + ylab('ISO')
overall_avg_iso5years <- overall_avg_iso5years + geom_smooth() + geom_text_repel(data = filter(fg_savant5years, `f_iso` > .295 | `f_iso` < .085), aes(totalEV, `f_iso`, label = Name))
overall_avg_iso5years
overall_avg_iso5years <- overall_avg_iso5years + geom_text(x = 86, y = .3, label = lm_eqn(fg_savant5years, fg_savant5years$totalEV, fg_savant5years$`f_iso`), parse = TRUE) + ggtitle('ISO vs. Overall AvgEV (5 years)')
overall_avg_iso5years

#5 year Max EV vs. wRC+
max_wrc5years <- ggplot(fg_savant5years, aes(maxEV, `wRC+`)) + geom_point() + xlab('Max EV') + ylab('wRC+')
max_wrc5years <- max_wrc5years + geom_smooth() + geom_text_repel(data = filter(fg_savant5years, `wRC+` > 150 | `wRC+` < 67), aes(maxEV, `wRC+`, label = Name))
max_wrc5years
max_wrc5years <- max_wrc5years + geom_text(x = 108, y = 180, label = lm_eqn(fg_savant5years, fg_savant5years$maxEV, fg_savant5years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. MaxEV (5 years)')
max_wrc5years

#5 year Max EV vs. ISO
max_iso5years <- ggplot(fg_savant5years, aes(maxEV, `f_iso`)) + geom_point() + xlab('Max EV') + ylab('ISO')
max_iso5years <- max_iso5years + geom_smooth() + geom_text_repel(data = filter(fg_savant5years, `f_iso` > .295 | `f_iso` < .085), aes(maxEV, `f_iso`, label = Name))
max_iso5years
max_iso5years <- max_iso5years + geom_text(x = 108, y = .3, label = lm_eqn(fg_savant5years, fg_savant5years$maxEV, fg_savant5years$`f_iso`), parse = TRUE) + ggtitle('ISO vs. MaxEV (5 years)')
max_iso5years

#5 year EV Diff vs. wRC+
ev_diff_wrc5years <- ggplot(fg_savant5years, aes(EV_diff, `wRC+`)) + geom_point() + xlab('Difference between AvgEV and Well-HitEV') + ylab('wRC+')
ev_diff_wrc5years <- ev_diff_wrc5years + geom_smooth() + geom_text_repel(data = filter(fg_savant5years, `wRC+` > 150 | `wRC+` < 67), aes(EV_diff, `wRC+`, label = Name))
ev_diff_wrc5years
ev_diff_wrc5years <- ev_diff_wrc5years + geom_text(x = 9.5, y = 170, label = lm_eqn(fg_savant5years, fg_savant5years$EV_diff, fg_savant5years$`wRC+`), parse = TRUE) + ggtitle('wRC+ vs. EV Difference (5 years)')
ev_diff_wrc5years

