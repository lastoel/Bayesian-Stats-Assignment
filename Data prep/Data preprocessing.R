### Data pre-processing

#libraries:
library(tidyverse)

dat.raw <- read.csv("DryEyesData.csv", header = T)

#tidy data
dat.tidy <- dat.raw %>%  #rename variables
  rename(week0.screentime = Baseline, week0.OSDI = X, week2.course_hrs = Week.2, week2.study_hrs = X.1, week2.leis_hrs = X.2, week2.OSDI = X.3, 
         week4.course_hrs = Week.4, week4.study_hrs = X.4, week4.leis_hrs = X.5, week4.OSDI = X.6, 
         week6.course_hrs = Week.6, week6.study_hrs = X.7, week6.leis_hrs = X.8, week6.OSDI = X.9) %>% 
  filter(Subject.Number != "NA") %>% #remove empty first row
  mutate_at(vars(starts_with("week"), starts_with("base")), (as.numeric)) %>% #store as numeric
  mutate(Sex = ifelse(Sex == "Male", 0 , 1)) #dummy code

#create sums of screentime
week2.screentime <- dat.tidy %>% select(starts_with("week2")) %>% select(-contains("OSDI")) %>% rowSums()
week4.screentime <- dat.tidy %>% select(starts_with("week4")) %>% select(-contains("OSDI")) %>% rowSums()
week6.screentime <- dat.tidy %>% select(starts_with("week6")) %>% select(-contains("OSDI")) %>% rowSums()
#create dataset to work with: 
dat <- cbind(dat.tidy[,1:5], week2.screentime, dat.tidy$week2.OSDI, week4.screentime, dat.tidy$week4.OSDI, week6.screentime, dat.tidy$week6.OSDI)
dat <- dat %>% rename(week2.OSDI = `dat.tidy$week2.OSDI`, week4.OSDI = `dat.tidy$week4.OSDI`, week6.OSDI = `dat.tidy$week6.OSDI`)

#data in long format too, for later (see Bayes Factor)
dat.long <- dat %>% pivot_longer(starts_with("week"), names_to = c("Week", ".value"), names_pattern = "week(.).(.*)")

save.image("Workspaces/Dataready.Rdata")
