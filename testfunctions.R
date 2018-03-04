cleanup <- function(desiredpat, targetfactor) {
  levels(targetfactor)[levels(targetfactor)==agrep(desiredpat, levels(targetfactor),
  value = TRUE, ignore.case = TRUE)] <- desiredpat
  return(levels(targetfactor))
}

# return all relevant levels
unique(levels(orevents)[c(agrep('extreme cold wind chill', levels(orevents), ignore.case = T), 
                           agrep('cold wind chill', levels(orevents), ignore.case = T), 
                           agrep('bitter wind chill', levels(orevents), ignore.case = T), 
                           agrep('blowing snow', levels(orevents), ignore.case = T), 
                           agrep('wind chill', levels(orevents), ignore.case = T), 
                           agrep('record cold', levels(orevents), ignore.case = T))])


# exclude certain results
levels(orevents)[setdiff(c(agrep('extreme cold wind chill', levels(orevents), ignore.case = T), 
                   agrep('cold wind chill', levels(orevents), ignore.case = T), 
                   agrep('bitter wind chill', levels(orevents), ignore.case = T), 
                   agrep('blowing snow', levels(orevents), ignore.case = T), 
                   agrep('wind chill', levels(orevents), ignore.case = T), 
                   agrep('record cold', levels(orevents), ignore.case = T)), 
        c(agrep('heavy snow', levels(orevents), ignore.case = T), 
        agrep('blizzard', levels(orevents), ignore.case = T)))]

# not working for some reason
# levels(orevents)[c(agrep('extreme cold wind chill', levels(orevents), ignore.case = T), 
#                    agrep('cold wind chill', levels(orevents), ignore.case = T), 
#                    agrep('bitter wind chill', levels(orevents), ignore.case = T), 
#                    agrep('blowing snow', levels(orevents), ignore.case = T), 
#                    agrep('wind chill', levels(orevents), ignore.case = T), 
#                    agrep('record cold', levels(orevents), ignore.case = T))][
#                      -c(agrep('heavy snow', levels(orevents), ignore.case = T), 
#                         agrep('blizzard', levels(orevents), ignore.case = T))]

test1 <- levels(orevents)[c(agrep('extreme cold wind chill', levels(orevents), ignore.case = T), 
                   agrep('cold wind chill', levels(orevents), ignore.case = T), 
                   agrep('bitter wind chill', levels(orevents), ignore.case = T), 
                   agrep('blowing snow', levels(orevents), ignore.case = T), 
                   agrep('wind chill', levels(orevents), ignore.case = T), 
                   agrep('record cold', levels(orevents), ignore.case = T))]
test1[!(test1 %in% exc2)]

# extract level indices with kachra
avalanche_levnums_kachra <- agrep('avalanche', levels(orevents), ignore.case = T)

extrmcold_indices_kachra <- unique(c(agrep('extreme cold wind chill', levels(orevents), ignore.case = T), agrep('bitter wind chill', levels(orevents), ignore.case = T), agrep('blowing snow', levels(orevents), ignore.case = T), agrep('extreme wind chill', levels(orevents), ignore.case = T), agrep('wind chill', levels(orevents), ignore.case = T), agrep('record cold', levels(orevents), ignore.case = T)))
# extract cleaned level indices 
avalanche_levnums_cleaned <- setdiff(agrep('avalanche', levels(orevents), ignore.case = T), agrep('heavy snow', levels(orevents), ignore.case = T))
extrmcold_indices_clean <- setdiff(unique(c(agrep('extreme cold wind chill', levels(testLevelsFrame$original_levels), ignore.case = T), agrep('bitter wind chill', levels(testLevelsFrame$original_levels), ignore.case = T), agrep('blowing snow', levels(testLevelsFrame$original_levels), ignore.case = T), agrep('extreme wind chill', levels(testLevelsFrame$original_levels), ignore.case = T), agrep('wind chill', levels(testLevelsFrame$original_levels), ignore.case = T), agrep('record cold', levels(testLevelsFrame$original_levels), ignore.case = T))), agrep('blizzard', levels(testLevelsFrame$original_levels), ignore.case = T))

# reassign levels to cleaned levels
levels(testLevelsFrame$newlevels)[setdiff(agrep('avalanche', levels(testLevelsFrame$original_levels), ignore.case = T), agrep('heavy snow', levels(testLevelsFrame$original_levels), ignore.case = T))] <- 'AVALANCHE'

levels(testLevelsFrame$newlevels)[avalanche_levnums_cleaned] <- 'AVALANCHE'

events2look4 <- list('tide', 'avalanche', 'black ice', 'blizzard', 'coastal flood', 'fire', 'cold wind chill', 'debris flow', 'dense fog', 'dense smoke', 'drought', 'dust devil', 'dust storm', 'excessive heat', 'extreme cold wind chill', 'flash flood', 'flood', 'frost/freeze', 'funnel cloud', 'freezing fog', 'hail', 'heat', 'heavy rain', 'heavy snow', 'high surf', 'high wind', 'hurricane', 'ice storm', 'lake-effect snow', 'lakeshore flood', 'lightning', 'marine hail', 'marine high wind', 'marine strong wind', 'marine thunderstorm wind', 'rip current', 'seiche', 'sleet', 'storm surge/tide', 'strong wind', 'thunderstorm wind', 'tornado', 'tropical depression', 'tropical storm', 'tsunami', 'volcanic ash', 'waterspout', 'wildfire', 'winter storm', 'winter weather')
names(events2look4) <- as.vector(events2look4)
