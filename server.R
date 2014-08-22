library(shiny)
library(lattice)

url<-'http://www.mathstat.strath.ac.uk/outreach/nessie/datasets/whiskies.txt'
whiskeys<-read.csv(url)

findWhiskeys<-function(body, notes){
    found<-subset(whiskeys, Body == body)
    for(note in notes){
        found<-subset(found, found[[note]] > 0)
    }
    return(found)
}

findNotes<-function(notes){
    out<- NULL
    if('Sweetness'%in%notes){out<-c(out, 'Sweet')}
    if('Smoky'%in%notes){out<-c(out, 'Smokey')}
    if('Medicinal'%in%notes){out<-c(out, 'Medicinal')}
    if('Tobacco'%in%notes){out<-c(out, 'Tobacco')}
    if('Honey'%in%notes){out<-c(out, 'Honey')}
    if('Spicy'%in%notes){out<-c(out, 'Spicy')}
    if('Winey'%in%notes){out<-c(out, 'Winey')}
    if('Nutty'%in%notes){out<-c(out, 'Nutty')}
    if('Malty'%in%notes){out<-c(out, 'Malty')}
    if('Fruity'%in%notes){out<-c(out, 'Fruity')}
    if('Floral'%in%notes){out<-c(out, 'Flowery')}
    
    if(is.character(out) == FALSE){return('No notes selected')}
    else {return(out)}
    
}



shinyServer(
    function(input,output){
        
        output$out1<-renderPrint({input$body})
        output$out2<-renderPrint({findNotes(input$notes)})
        
        output$plot1<-renderPlot({
            input$goButton
            Whiskeys<- findWhiskeys(input$body, input$notes)
            if (length(Whiskeys[,1])>=1){ 
                random<- sample(1:length(Whiskeys[,1]), 1)
                whiskey<-Whiskeys[random,]
                dist<-as.character(whiskey$Distillery)
                barchart(as.numeric(whiskey[3:14])~colnames(whiskey)[3:14],
                     scales=list(x=list(rot=45)),
                     xlab = 'Body and Notes', ylab = 'Prevalence',
                     ylim=c(0,4.5),
                     main = dist)
            }
            else (
                plot(c(0, 1), c(0, 1), ann = T, 
                     bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n',
                     xlab = '', ylab = '',
                     main = 'No Whiskeys Found to Match Your Criteria')
                )
        
    })
})