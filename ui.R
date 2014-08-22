library(shiny)
library(lattice)
library(markdown)


shinyUI(navbarPage("Navigation",
    tabPanel("Find Me Scotch",
        headerPanel("I. Like. Scotch."),
        sidebarLayout(
            sidebarPanel(
                h3('So this is what I like:'),
                #numericInput('id1', 'Numeric input, labeled id1', 0, min=0, max=10, step = 1),
                sliderInput('body', 'I like my body:', value = 2, min = 0, max = 4, step = 1),
                checkboxGroupInput('notes', 'I need these notes:',
                        c('Sweetness'= 'Sweetness',
                        'Smokey' = 'Smoky',
                        'Medicinal' = 'Medicinal',
                        'Tobacco' = 'Tobacco',
                        'Honey' = 'Honey',
                        'Spicy' = 'Spicy',
                        'Winey' = 'Winey',
                        'Nutty' = 'Nutty',
                        'Malty' = 'Malty',
                        'Fruity' = 'Fruity',
                        'Floral' = 'Floral')),
                actionButton('goButton', 'Find Me A Distillery')
                #submitButton('Find Me Distilleries')
                ),

        mainPanel(
                h3('For'),
                h4('Body:'),
                verbatimTextOutput('out1'),
                h4('And Notes:'),
                verbatimTextOutput('out2'),
                h3('You might like distillery:'),
#               verbatimTextOutput('out3'),
                plotOutput('plot1'),
                
                
                h6('Constructed with data set: http://www.mathstat.strath.ac.uk/outreach/nessie/datasets/whiskies.txt')
            ))
    ),
    tabPanel("About",
           fluidRow(
               column(6,
                  includeMarkdown("about.md")
                   )
               
        ))
))







# shinyUI(pageWithSidebar(
#     #title
#     headerPanel("I. Like. Scotch."),
#     
#     sidebarPanel(
#         h3('So this is what I like:'),
#         #numericInput('id1', 'Numeric input, labeled id1', 0, min=0, max=10, step = 1),
#         sliderInput('body', 'I like my body:', value = 2, min = 0, max = 4, step = 1),
#         checkboxGroupInput('notes', 'I need these notes:',
#                            c('Sweetness'= 'Sweetness',
#                              'Smokey' = 'Smoky',
#                              'Medicinal' = 'Medicinal',
#                              'Tobacco' = 'Tobacco',
#                              'Honey' = 'Honey',
#                              'Spicy' = 'Spicy',
#                              'Winey' = 'Winey',
#                              'Nutty' = 'Nutty',
#                              'Malty' = 'Malty',
#                              'Fruity' = 'Fruity',
#                              'Floral' = 'Floral')),
#         actionButton('goButton', 'Find Me A Distillery')
#         #submitButton('Find Me Distilleries')
#         ),
#     
#     mainPanel(
#         h3('For'),
#         h4('Body:'),
#         verbatimTextOutput('out1'),
#         h4('And Notes:'),
#         verbatimTextOutput('out2'),
#         h3('You might like distillery:'),
# #         verbatimTextOutput('out3'),
#         plotOutput('plot1'),
#         
#         
#         h6('Constructed with data set: http://www.mathstat.strath.ac.uk/outreach/nessie/datasets/whiskies.txt')
#     )
# ))