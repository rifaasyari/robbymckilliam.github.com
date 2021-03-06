print("Generating markstats.pdf from marks.csv")

marksdata <- read.csv("marks.csv")
pdf(file='markstats.pdf', width=10, height=9)

labeledhistogram <- function(data, name, maxmark) {
hist(data,breaks=0:(maxmark+1)-0.5,prob=TRUE,xlab="Mark",main=sprintf("%s \n # of students %i, mean %.2f, median %.0f, stdev %.2f", name, length(data), mean(data), median(data), sd(data)) )
lines(density(data,bw="SJ"))
}

layout(matrix(c(1,2,3,4,5,5), 3, 2, byrow = TRUE))

labeledhistogram(na.omit(marksdata$Midsem.exam), "Midsemester test", 20)
labeledhistogram(na.omit(marksdata$Practical.assignment), "Practical assignment", 20)
labeledhistogram(na.omit(marksdata$Theory.assignment), "Theory assignment", 20)
labeledhistogram(na.omit(marksdata$Final.exam), "Final exam", 40)
labeledhistogram(na.omit(marksdata$Total), "Total", 100)

#midsemmarks <- na.omit(marksdata$Midsem.exam)
#hist(midsemmarks,breaks=0:21-0.5,prob=TRUE,xlab="Marks",main=sprintf("Midsemester exam \n # of students %i,  mean %.2f, median %.0f, stdev %.2f", #length(midsemmarks), mean(midsemmarks), median(midsemmarks), sd(midsemmarks)))
#lines(density(midsemmarks,bw="SJ"))

dev.off()

