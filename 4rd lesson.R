data("iris")
str(iris)
#install.packages('ggplot2')
library(ggplot2)

# aestics- color, size

g1 <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color=Species ))
g1+geom_point()
# sarqel barplot aranc stat= "count" i
class_mpg <- as.vector(unique(mpg['class']))
freq <- c()
for (i in 1: nrow(class_mpg)) {
  freq <- append(freq, sum(mpg['class'] == as.character(class_mpg[i,1])))
  print(freq)
}
freq
new_ <- data.frame(class_mpg, freq)
new_
g <- ggplot(new_)
g + geom_bar(mapping = aes(x= class , y = freq),stat = 'identity')
ggplot() + geom_line(data = iris, aes(x = Sepal.Length, y = Sepal.Width))

g1 + geom_line() + geom_point() + theme_bw()
g1 + geom_point(color = 'red', size = 7)
g1 + geom_point(color='blue', size=7, shape=9)
scale_color_brewer() # guynery tal paleti mijocov, manual() dzerqov
? geom_point




colors()
col2rgb(col = 1:6)
col2rgb('white')
library(RColorBrewer)
brewer.pal(n=5, name='Set3')
g1 <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color=Species )) + 
  scale_color_manual(values=c('red', 'green', 'orange'))
g1 + geom_point()
install.packages('wesanderson')
library(wesanderson)
wes_palette(name = 'IsleofDogs2')
