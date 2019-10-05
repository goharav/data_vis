library(wesanderson)
wes_palettes$Darjeeling1
library(ggplot2)
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point() + 
  scale_color_manual(values = c("#FF0000", "#00A08A", "#F2AD00", "#F98400", "#5BBCD6"))

## scale color brewer 

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point() + 
  scale_color_manual(values = wes_palette('GrandBudapest1'))

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length)) + geom_point()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, shape = Species)) + geom_point()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, size = Petal.Length)) + geom_point()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, size = Petal.Length)) + geom_point()

movie <- read.csv('movies3.csv')
colnames(movie)
ggplot(movie, aes(x=imdbRating)) + geom_histogram(binwidth = 0.2)
summer <- read.csv('summer.csv')
summer_usa <- summer[summer$Country == 'USA',]
ggplot(summer_usa, aes(x=Medal)) + geom_bar()
summer_usa$Medal <- factor(summer_usa$Medal, levels = c('Silver', 'Gold', 'Bronze'))
ggplot(summer_usa, aes(x=Medal)) + geom_bar(fill = c("#E6E8FA", "#CFB53B","#8C7853"))
usa_medals <- data.frame(Medal=c('Silver',"Gold","Bronze"), Percentage= c(0.27,0.49,0.24))
ggplot(usa_medals, aes(x=Medal, y=Percentage)) + geom_bar(stat = 'identity', fill = c(4,5,8))
summer_usa$Medal <- factor(summer_usa$Medal, levels = c('Bronze','Silver','Gold'))
ggplot(summer_usa, aes(x=Year, fill=Medal)) + geom_bar(position = 'dodge')
ggplot(summer_usa, aes(x=Year, fill=Medal)) + geom_bar(position = 'fill')

ggplot(usa_medals, aes(x=Medal, y=Percentage)) + geom_bar(stat = 'identity', fill = c(4,5,8)) + coord_flip()
ggplot(summer_usa, aes(x= factor(1), fill = Medal)) + geom_bar(width = 1) + coord_polar(theta = 'y')
ggplot(movie, aes(x= Metascore, y = imdbRating)) + geom_point(alpha=0.3, col='red', size=2.7) + 
  coord_cartesian(ylim = c(5,10), xlim = c(50,100))
#geom_ jitter
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot() + coord_flip()
ggplot(data = iris, aes(x = Species, y = Petal.Length)) + geom_boxplot()


### 6th lesson
head(movie)
options(scipen=999)
ggplot(movie, aes(x=gross_adjusted)) + geom_histogram()
ggplot(movie, aes(y=gross_adjusted, x='')) + geom_boxplot() + coord_cartesian(ylim = c(0,750000000)) # right skewed dist

ggplot(movie, aes(x=Metascore)) + geom_histogram()
ggplot(movie, aes(y=Metascore, x="")) + geom_boxplot() + coord_flip()

# faceting
movie_sub <- movie[movie$genre_first %in% c('Action', 'Comedy') & movie$Rated %in% c('PG', 'PG-13', 'R'),]
ggplot(movie_sub, aes(x=Metascore, y=imdbRating)) + geom_point() + facet_grid(~Rated)
ggplot(movie_sub, aes(x=Metascore, y=imdbRating)) + geom_point() + facet_grid(Rated~.)
ggplot(movie_sub, aes(x=imdbRating)) + geom_histogram(fill='red') + facet_grid(Rated~genre_first)
ggplot(movie, aes(x=Metascore, y=imdbRating)) + geom_point() + ggtitle("IMDB ratings vs Metascore") + 
  xlab('Metascore')+ ylab('IMDB')
ggplot(movie_sub, aes(x=Metascore, y=imdbRating)) + geom_point() +
  labs(title = "IMDB ratings vs Metascore", xlab= "Metascore", ylab="IMDB") + 
  theme(panel.background = element_rect(fill = "green"))

ggplot(movie_sub, aes(x=Metascore, y=imdbRating)) + geom_point() +
  labs(title = "IMDB ratings vs Metascore", xlab= "Metascore", ylab="IMDB") + 
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_line(color = 'red'))

ggplot(movie_sub, aes(x=Metascore, y=imdbRating)) + geom_point() +
  labs(title = "IMDB ratings vs Metascore", xlab= "Metascore", ylab="IMDB") + 
  theme(axis.text.x = element_text(size = 15, color = "red", face = "italic"),
        axis.title.x = element_text(color = "green", size = 16),
        axis.ticks.x = element_line(size = 1.5, color = "red"))

# theme_bw()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
cor(iris$Sepal.Length, iris$Sepal.Width)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + 
  geom_smooth(method = "lm", se = F)

cor(iris$Sepal.Length[iris$Species == "setosa"], iris$Sepal.Width[iris$Species == "setosa"])
cor(iris$Sepal.Length[iris$Species == "versicolor"], iris$Sepal.Width[iris$Species == "versicolor"]) 
cor(iris$Sepal.Length[iris$Species == "virginica"], iris$Sepal.Width[iris$Species == "virginica"]) 

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point() + 
  geom_smooth(method = "lm", se = F)


## Simson paradox


## Data manipulation

