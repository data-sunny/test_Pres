






#       Week 2 dp - lec 3 : slidify working it out

                # fixing slidify error issues
                install_github('ramnathv/slidify', ref = github_pull(425))
                library(knitr)
                author('test')
                slidify('index.Rmd')
                browseURL('index.Rmd')
     
#       Week 2 dp - lec 2: slidify

#             Getting Slidify
            
#             First, make sure you have devtools installed and loaded
            install.packages("devtools")
            library(devtools)
#             Second, install Slidify
#             install_github('slidify', 'ramnathv')
#             install_github('slidifyLibraries', 'ramnathv')
            install_github('ramnathv/slidify')
            install_github('ramnathv/slidifyLibraries')
#             Third, load Slidify
            library(slidify)
            
#             Getting started with Slidify
            
#             Set the working directory to where you want to create your Slidify project
            setwd("~/sample_project/")
#             Create your project and give your project a name (My project is named "first_deck")
            author("first_deck")
            
            
#             Getting to know index.Rmd : Making Slides
            
#             To compile presentation ensure the working dir contains your index.Rmd file & enter following command:
                slidify("index.Rmd")
#             An HTML flie should appear in current dir, open with your favorite web browser & enjoy your Slidify deck!
                browseURL("index.html")

##############################################################################
        # Deploy a practise App
            
        install.packages('devtools') # install devtools
        devtools::install_github('rstudio/shinyapps')  # intall shinapps
        library( shinyapps ) # load into R session
        shinyapps::setAccountInfo(name='data-sunny', 
                                  token='3398B1041C2F21B37B26D7D7E8ABE10B', 
                                  secret='aOgiyzaA3Onc10WXUKwuOk/bQT+GiDOUvJ8ZVV4N') # token & secret from shinyapps.io

        # a demo app
        install.packages(c('ggplot2', 'shiny'))
        
        # 1. create server.R, ui.R
        
        # 2. test app
            library(shiny)
            runApp()
        
        # 3. deploy app
            library(shinyapps)
            deployApp()

        # 4. need some packages
        install.packages("manipulate"); library(manipulate)
        devtools::install_github("ropensci/plotly"); library(plotly)
        
        # 4. redo step 3
        
   #########################################################################     
        
        # week 1 dp - lec 18 : plotly - didnt get it to work

             load("courseraData.rda")
            
            
            ## Make sure that you've followed the first few set up steps
            ## https://plot.ly/ggplot2/getting-started/
            ## Particularly set_credentials_file(username=FILL IN, api_key=FILL IN)
            library(plotly)
            
            
            library(ggplot2)
            ## First do a bar plot in ggplot
            g <- ggplot(myData, aes(y = enrollment, x = class, fill = offering)) 
            g <- g + geom_bar(stat = "identity")
            g
            
            ## Let's try to get it into plot.ly
            py <- plotly()
            out <- py$ggplotly(g)
            out$response$url


        # week 1 dp - lec 17 : Google Vis

#         Example
        install.packages("googleVis")
        suppressPackageStartupMessages(library(googleVis))
        M <- gvisMotionChart(Fruits, "Fruit", "Year",
                             options=list(width=600, height=400))
        print(M,"chart")
#         Charts in googleVis
#         
#         "gvis + ChartType"
#         Motion charts: gvisMotionChart
#         Interactive maps: gvisGeoChart
#         Interactive tables: gvisTable
#         Line charts: gvisLineChart
#         Bar charts: gvisColumnChart
#         Tree maps: gvisTreeMap


#         Plots on maps
        
        G <- gvisGeoChart(Exports, locationvar="Country",
                          colorvar="Profit",options=list(width=600, height=400))
        print(G,"chart")
#         Specifying a region
        
        G2 <- gvisGeoChart(Exports, locationvar="Country",
                           colorvar="Profit",options=list(width=600, height=400,region="150"))
        print(G2,"chart")
        
#         Setting more options
        
        df <- data.frame(label=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))
        Line <- gvisLineChart(df, xvar="label", yvar=c("val1","val2"),
                              options=list(title="Hello World", legend="bottom",
                                           titleTextStyle="{color:'red', fontSize:18}",                         
                                           vAxis="{gridlines:{color:'red', count:3}}",
                                           hAxis="{title:'My Label', titleTextStyle:{color:'blue'}}",
                                           series="[{color:'green', targetAxisIndex: 0}, 
                         {color: 'blue',targetAxisIndex:1}]",
                                           vAxes="[{title:'Value 1 (%)', format:'##,######%'}, 
                                  {title:'Value 2 (\U00A3)'}]",                          
                                           curveType="function", width=500, height=300                         
                              )) 
#         Setting more options
        
        print(Line,"chart")
#         Combining multiple plots together
        
        G <- gvisGeoChart(Exports, "Country", "Profit",options=list(width=200, height=100))
        T1 <- gvisTable(Exports,options=list(width=200, height=270))
        M <- gvisMotionChart(Fruits, "Fruit", "Year", options=list(width=400, height=370))
        GT <- gvisMerge(G,T1, horizontal=FALSE)
        GTM <- gvisMerge(GT, M, horizontal=TRUE,tableOptions="bgcolor=\"#CCCCCC\" cellspacing=10")
#         Combining multiple plots together
        
        print(GTM,"chart")
#         Seeing the HTML code
        
        M <- gvisMotionChart(Fruits, "Fruit", "Year", options=list(width=600, height=400))
        print(M)
        print(M, 'chart', file='myfilename.html')

        # week 1 dp - lec 15 : rChart examples
#             morris
            
            data(economics, package = "ggplot2")
            econ <- transform(economics, date = as.character(date))
            m1 <- mPlot(x = "date", y = c("psavert", "uempmed"), type = "Line", data = econ)
            m1$set(pointSize = 0, lineWidth = 1)
            m1$save('fig/m1.html', cdn = TRUE)
            cat('<iframe src="fig/m1.html" width=100%, height=600></iframe>')
#             morris example run
            
            data(economics, package = "ggplot2")
            econ <- transform(economics, date = as.character(date))
            m1 <- mPlot(x = "date", y = c("psavert", "uempmed"), type = "Line", data = econ)
            m1$set(pointSize = 0, lineWidth = 1)
            m1$save('fig/m1.html', cdn = TRUE)
            cat('<iframe src="fig/m1.html" width=100%, height=600></iframe>')
            
#             xCharts
            
            require(reshape2)
            uspexp <- melt(USPersonalExpenditure)
            names(uspexp)[1:2] = c("category", "year")
            x1 <- xPlot(value ~ year, group = "category", data = uspexp, type = "line-dotted")
            x1$save('fig/x1.html', cdn = TRUE)
            cat('<iframe src="fig/x1.html" width=100%, height=600></iframe>')

#             xCharts run
            
            require(reshape2)
            uspexp <- melt(USPersonalExpenditure)
            names(uspexp)[1:2] = c("category", "year")
            x1 <- xPlot(value ~ year, group = "category", data = uspexp, type = "line-dotted")
            x1$save('fig/x1.html', cdn = TRUE)
            cat('<iframe src="fig/x1.html" width=100%, height=600></iframe>')
            
#             Leaflet
            
            map3 <- Leaflet$new()
            map3$setView(c(51.505, -0.09), zoom = 13)
            map3$marker(c(51.5, -0.09), bindPopup = "<p> Hi. I am a popup </p>")
            map3$marker(c(51.495, -0.083), bindPopup = "<p> Hi. I am another popup </p>")
            map3$save('fig/map3.html', cdn = TRUE)
            cat('<iframe src="fig/map3.html" width=100%, height=600></iframe>')
            
#             Leaflet run
            
            map3 <- Leaflet$new()
            map3$setView(c(51.505, -0.09), zoom = 13)
            map3$marker(c(51.5, -0.09), bindPopup = "<p> Hi. I am a popup </p>")
            map3$marker(c(51.495, -0.083), bindPopup = "<p> Hi. I am another popup </p>")
            map3$save('fig/map3.html', cdn = TRUE)
            cat('<iframe src="fig/map3.html" width=100%, height=600></iframe>')
            
#             Rickshaw
            
            usp = reshape2::melt(USPersonalExpenditure)
            # get the decades into a date Rickshaw likes
            usp$Var2 <- as.numeric(as.POSIXct(paste0(usp$Var2, "-01-01")))
            p4 <- Rickshaw$new()
            p4$layer(value ~ Var2, group = "Var1", data = usp, type = "area", width = 560)
            # add a helpful slider this easily; other features TRUE as a default
            p4$set(slider = TRUE)
            p4$save('fig/p4.html', cdn = TRUE)
            cat('<iframe src="fig/p4.html" width=100%, height=600></iframe>')
            
#             Rickshaw run
            
            usp = reshape2::melt(USPersonalExpenditure)
            # get the decades into a date Rickshaw likes
            usp$Var2 <- as.numeric(as.POSIXct(paste0(usp$Var2, "-01-01")))
            p4 <- Rickshaw$new()
            p4$layer(value ~ Var2, group = "Var1", data = usp, type = "area", width = 560)
            # add a helpful slider this easily; other features TRUE as a default
            p4$set(slider = TRUE)
            p4$save('fig/p4.html', cdn = TRUE)
            cat('<iframe src="fig/p4.html" width=100%, height=600></iframe>')
            
#             highchart
            
            h1 <- hPlot(x = "Wr.Hnd", y = "NW.Hnd", data = MASS::survey, type = c("line", 
                                                                                  "bubble", "scatter"), group = "Clap", size = "Age")
            h1$save('fig/h1.html', cdn = TRUE)
            cat('<iframe src="fig/h1.html" width=100%, height=600></iframe>')
            
#             highchart run
            
            h1 <- hPlot(x = "Wr.Hnd", y = "NW.Hnd", data = MASS::survey, type = c("line", 
                                                                                  "bubble", "scatter"), group = "Clap", size = "Age")
            h1$save('fig/h1.html', cdn = TRUE)
            cat('<iframe src="fig/h1.html" width=100%, height=600></iframe>')


#                 Example 2 Facetted Barplot
                
                hair_eye = as.data.frame(HairEyeColor)
                r2 <- rPlot(Freq ~ Hair | Eye, color = 'Eye', data = hair_eye, type = 'bar')
                r2$save('fig/r2.html', cdn = TRUE)
                cat('<iframe src="fig/r2.html" width=100%, height=600></iframe>')
                
#                 Example 2 Facetted Barplot, when run
                
                hair_eye = as.data.frame(HairEyeColor)
                r2 <- rPlot(Freq ~ Hair | Eye, color = 'Eye', data = hair_eye, type = 'bar')
#                 r2$save('fig/r2.html', cdn = TRUE)
                r2$save('fig/r2.html')
                cat('<iframe src="fig/r2.html" width=100%, height=600></iframe>')
                
                
#                 How to get the js/html or publish an rChart
#                 Now you can add whatever you'd like
                
                r1 <- rPlot(mpg ~ wt | am + vs, data = mtcars, type = "point", color = "gear")
                r1$print("chart1") # print out the js 
                r1$save('myPlot.html') #save as html file
                r1$publish('myPlot', host = 'gist') # save to gist, rjson required
                r1$publish('myPlot', host = 'rpubs') # save to rpubs






                    #Deconstructing another example
                    
                    ## Example 1 Facetted Scatterplot
                    names(iris) = gsub("\\.", "", names(iris))
                    r1 <- rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type = 'point')
                    r1$save('fig/r1.html', cdn = TRUE)
                    cat('<iframe src="fig/r1.html" width=100%, height=600></iframe>')
       

        # week 1 dp - lec 13..15 : rCharts
                
#                 install.packages("downloader")
#                 library(downloader)
#                 download("https://github.com/ramnathv/rCharts/archive/master.tar.gz", "rCharts.tar.gz")
#                 install.packages("rCharts.tar.gz", repos = NULL, type = "source")
                
                
                install.packages('Rcpp')
                install.packages("devtools")
#                 install.packages('Rtools')
                require(devtools)
                install_github('ramnathv/rCharts')
                
                
                
                # Example - could not get it to work
                
                require(rCharts)
                    require(knitr)
                haireye = as.data.frame(HairEyeColor)
                n1 <- nPlot(Freq ~ Hair, group = 'Eye', type = 'multiBarChart',
                            data = subset(haireye, Sex == 'Male')
                )
                n1$save('fig/n1.html', cdn = TRUE)
                cat('<iframe src="fig/n1.html" width=100%, height=600></iframe>')
                
                


        # week 1 dp - lec 12 : manipulate
            library(manipulate)
            manipulate(plot(1:x), x = slider(1, 100))

            # Example from the regression class
            
            library(manipulate)
            install.packages("UsingR"); library(UsingR)
            myHist <- function(mu){
                hist(galton$child,col="blue",breaks=100)
                lines(c(mu, mu), c(0, 150),col="red",lwd=5)
                mse <- mean((galton$child - mu)^2)
                text(63, 150, paste("mu = ", mu))
                text(63, 140, paste("MSE = ", round(mse, 2)))
            }
            manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))
            
            

        # week 1 dp - lec 9 : Reactive function
            # example


                    # Here's some replaced code from our previous server.R
                    
                    output$text3 <- renderText({
                        if (input$goButton == 0) "You have not pressed the button"
                        else if (input$goButton == 1) "you pressed it once"
                        else "OK quit pressing it"
                    })

            # non-reactive reactivity

                            # ui.R
                            
                            shinyUI(pageWithSidebar(
                                headerPanel("Hello Shiny!"),
                                sidebarPanel(
                                    textInput(inputId="text1", label = "Input Text1"),
                                    textInput(inputId="text2", label = "Input Text2"),
                                    actionButton("goButton", "Go!")
                                ),
                                mainPanel(
                                    p('Output text1'),
                                    textOutput('text1'),
                                    p('Output text2'),
                                    textOutput('text2'),
                                    p('Output text3'),
                                    textOutput('text3')
                                )
                            ))
                            # Server.R
                            
                            shinyServer(
                                function(input, output) {
                                    output$text1 <- renderText({input$text1})
                                    output$text2 <- renderText({input$text2})
                                    output$text3 <- renderText({
                                        input$goButton
                                        isolate(paste(input$text1, input$text2))
                                    })
                                }
                            )

            # reactivity expressions
                            # Example
                            
                            # server.R
                            
                            shinyServer(
                                function(input, output) {
                                    x <- reactive({as.numeric(input$text1)+100})      
                                    output$text1 <- renderText({x()                          })
                                    output$text2 <- renderText({x() + as.numeric(input$text2)})
                                }
                            )
                            # As opposed to
                            
                            shinyServer(
                                function(input, output) {
                                    output$text1 <- renderText({as.numeric(input$text1)+100  })
                                    output$text2 <- renderText({as.numeric(input$text1)+100 + 
                                                                    as.numeric(input$text2)})
                                }
                            )
                                        


        # week 1 dp - lec 8 : Shinier ... Reactivity


                        # ui.R
                        
                        shinyUI(pageWithSidebar(
                            headerPanel("Hello Shiny!"),
                            sidebarPanel(
                                textInput(inputId="text1", label = "Input Text1"),
                                textInput(inputId="text2", label = "Input Text2")
                            ),
                            mainPanel(
                                p('Output text1'),
                                textOutput('text1'),
                                p('Output text2'),
                                textOutput('text2'),
                                p('Output text3'),
                                textOutput('text3'),
                                p('Outside text'),
                                textOutput('text4'),
                                p('Inside text, but non-reactive'),
                                textOutput('text5')
                            )
                        ))
                        
                        
                        
                        # server.R Set x <- 0 before running
                        
                        library(shiny)
                        x <<- x + 1
                        y <<- 0
                        
                        shinyServer(
                            function(input, output) {
                                y <<- y + 1
                                output$text1 <- renderText({input$text1})
                                output$text2 <- renderText({input$text2})
                                output$text3 <- renderText({as.numeric(input$text1)+1})
                                output$text4 <- renderText(y)
                                output$text5 <- renderText(x)
                            }
                        )


        # week 1 dp - lec 6 : Images

                        # ui.R
                        
                        shinyUI(pageWithSidebar(
                            headerPanel("Example plot"),
                            sidebarPanel(
                                sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
                            ),
                            mainPanel(
                                plotOutput('newHist')
                            )
                        ))
                        
                        
                        # server.R
                        
                        library(UsingR)
                        data(galton)
                        
                        shinyServer(
                            function(input, output) {
                                output$newHist <- renderPlot({
                                    hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
                                    mu <- input$mu
                                    lines(c(mu, mu), c(0, 200),col="red",lwd=5)
                                    mse <- mean((galton$child - mu)^2)
                                    text(63, 150, paste("mu = ", mu))
                                    text(63, 140, paste("MSE = ", round(mse, 2)))
                                })
                                
                            }
                        )


        # week 1 dp - lec 5 : basic prediction function
                    # Let's build our prediction function - ui.R
                    
                    shinyUI(
                      pageWithSidebar(
                        # Application title
                        headerPanel("Diabetes prediction"),
                    
                        sidebarPanel(
                          numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
                          submitButton('Submit')
                        ),
                        mainPanel(
                            h3('Results of prediction'),
                            h4('You entered'),
                            verbatimTextOutput("inputValue"),
                            h4('Which resulted in a prediction of '),
                            verbatimTextOutput("prediction")
                        )
                      )
                    )
                    
                    
                    # server.R
                    
                    diabetesRisk <- function(glucose) glucose / 200
                    
                    shinyServer(
                        function(input, output) {
                            output$inputValue <- renderPrint({input$glucose})
                            output$prediction <- renderPrint({diabetesRisk(input$glucose)})
                        }
                    )
                    

        # week 1 dp - lecture 4 : basic html ...

            # server.R
                shinyServer(
                    function(input, output) {
                        output$oid1 <- renderPrint({input$id1})
                        output$oid2 <- renderPrint({input$id2})
                        output$odate <- renderPrint({input$date})
                    }
                    )

            # illustrating outputs
                mainPanel(
                    h3( 'Illustrating outputs'),
                    h4('You entered'),
                    verbatimTextOutput("oid1"),
                    h4('You entered'),
                    verbatimTextOutput("oid2"),
                    h4('You entered'),
                    verbatimTextOuptou("odate")
                    )

            # illustrating inputs
                    shinyUI( pageWithSidebar(
                        headerPanel("Illustrating inputs"),
                        sidebarPanel(
                            numericInput('id1', 'Numeric input, labeled id1', 0, min=0, max=10, step=1),
                            checkboxGroupInput("id2", "Checkbox",
                                               c("Value 1" = "1",
                                                 "Value 2" = "2",
                                                 "Value 3" = "3")),
                            dateInput("date", "Date:")
                            ),
                        mainPanel(
                            
                            )
                        ))




            #  illustrating markup
                    library(shiny)
                    shinyUI( pageWithSidebar(
                        
                        headerPanel("Illustrating markup"),
                        sidebarPanel(
                            h1('Sidebar panel'),
                            h1('H1 text'),
                            h2('H2 text'),
                            h3('H3 text'),
                            h4('H4 text')
                        ),
                        
                        mainPanel(
                            h3('Main Panel text'),
                            code('some code'),
                            p('some ordinary text')
                        )
                    ))

        # week 1 dp - lecture 4 : basic html and getting inputs

            # ui.R
                shinyUI( pageWithSidebar(
                    
                    headerPanel("Illustrating markup"),
                    sidebarPanel(
                        h1('Sidebar panel'),
                        h1('H1 text'),
                        h2('H2 text'),
                        h3('H3 text'),
                        h4('H4 text')
                        ),
                    
                    mainPanel(
                        h3('Main Panel text'),
                        code('some code'),
                        p('some ordinary text')
                        )
                    ))

        # week 1 dp - lecture 3 : intro to shiny

        install.packages("shiny")
        library(shiny)
        
        # ui.R file
            library(shiny)
            shinyUI( pageWithSidebar(
                        headerPanel("Data science FTW!"),
                        sidebarPanel(
                            h3('Sidebar text')
                            ),
                        mainPanel(
                            h3('Main Panel text')
                            )
                        ))
        # server.R file
            library(shiny)
            shinyServer(
                function(input,output){
                }
                )
        