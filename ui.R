shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Son Height Prediction"),
        
        sidebarPanel(
            h3('Instructions'),
            h5('To you utlize the app, simply submit the height of the father and a prediction of the son height will be generated.  Also, a histogram will be rendered of all the son height data along side a redline refenencing the prediction. 
'),
            numericInput('new.num', 'Height of Father (inches)', 68, min = 59, max = 78, step = 2),
            submitButton('Submit')
        ),
        mainPanel(
            h3('Results of prediction(inches)'),
            h4('For the height of the Father you entered'),
            verbatimTextOutput("new.num"),
            h4('Which resulted in a son height prediction of '),
            verbatimTextOutput("prediction"),
            h4('The upper 95 percent confidence bound of the prediction is'),
            verbatimTextOutput("upper"),
            h4('The lower 95 percent confidence bound of the prediction is'),
            verbatimTextOutput("lower"),
                        
            plotOutput('newHist')
        )
    )
)