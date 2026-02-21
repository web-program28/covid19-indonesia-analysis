# impor data
data <-read.csv("~/Downloads/owid-covid-data.csv")

# memfilter data hanya untuk lokasi indonesia
indo <- data %>% filter(location == 'Indonesia')

# memilih kolom tertentu
pilih <-indo %>% select(location, date, new_cases, new_deaths,
                        total_cases_per_million,new_cases_smoothed,
                        new_deaths_smoothed, population)

# menghilangkan NA
coba<-na.omit(indo)

coba$date <- as.Date(coba$date)

# Menagktifkan library ggplot
library(ggplot2)

# membuat layer 1
ggplot(coba)

#membuat layer 2
ggplot(coba, aes(x=date, y=new_cases_smoothed))

#membuat layer 3
ggplot(coba, aes(x=date, y=new_cases_smoothed)) + geom_line()

#membuat layer 4
p <-ggplot(coba, aes(x=date, y=new_cases_smoothed)) + geom_line()
p 
p + theme_minimal()
m <-p + theme_minimal() 
m + ggtitle('Tren Covid-19 di Indonesia Tahun 2020') + geom_line(alpha = 0.5) +
  labs(x = 'bulan', y = 'kasus baru') + theme(plot.title=element_text(hjust=0.5))

