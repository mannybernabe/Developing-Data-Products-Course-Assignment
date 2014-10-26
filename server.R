
predict.fun<-function(x){
library("UsingR")
data(father.son)
lm1<-lm(sheight ~ fheight, data=father.son)
newParent.df<-data.frame(fheight=x)
round(predict(lm1,newdata=newParent.df,interval = "prediction")[1],2)

}

predictUp.fun<-function(x){
    library("UsingR")
    data(father.son)
    lm1<-lm(sheight ~ fheight, data=father.son)
    newParent.df<-data.frame(fheight=x)
    round(predict(lm1,newdata=newParent.df,interval = "prediction")[3],2)
    
}

predictDown.fun<-function(x){
    library("UsingR")
    data(father.son)
    lm1<-lm(sheight ~ fheight, data=father.son)
    newParent.df<-data.frame(fheight=x)
    round(predict(lm1,newdata=newParent.df,interval = "prediction")[2],2)
    
}









shinyServer(
    function(input, output) {
        output$new.num <- renderPrint({input$new.num})
        output$prediction <- renderPrint({predict.fun(input$new.num)})
        output$upper <- renderPrint({predictUp.fun(input$new.num)})
        output$lower <- renderPrint({predictDown.fun(input$new.num)})
        
        
        output$newHist <- renderPlot({
            hist(father.son$sheight, xlab='Son height', col='lightblue',main='Histogram of Son Heights')
            text(63, 220, paste("Father Height = ", input$new.num))
            text(63, 200, paste("Predicted Son Height = ", predict.fun(input$new.num)))
            legend("topright", title="Legend","Predicted Son Height",col="red",lwd=3)
            newChild.df<-predict.fun(input$new.num)
            abline(v=newChild.df, col="red",lwd=3)
        })
        
            
    }
)