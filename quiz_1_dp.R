

            # quiz 1 - dp : q5 .. this code plots a sliding (guessed) mu on a histogram
                
                    # ui.R
                            shinyUI(pageWithSidebar(
                                headerPanel("Example plot"),
                                sidebarPanel(
                                    sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)
                                ),
                                mainPanel(
                                    plotOutput('myHist')
                                )
                            ))
                    # server.R
                            library(UsingR)
                            data(galton)
                            
                            shinyServer(
                                function(input, output) {
                                    output$myHist <- renderPlot({
                                        hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
                                        mu <- input$mu
                                        lines(c(mu, mu), c(0, 200),col="red",lwd=5)
                                        mse <- mean((galton$child - mu)^2)
                                        text(63, 150, paste("mu = ", mu))
                                        text(63, 140, paste("MSE = ", round(mse, 2)))
                                    })
                                    
                                }
                            )
                            

            # quiz 1 - dp : q4
                # create a sortable and searchable data table
                # assume rCharts and airquality data set loaded
                            dTable(airquality, sPaginationType = "full_numbers")

            # quiz 1 - dp : q2
                data(airquality)
                
                # install rCharts
                    install.packages("devtools")
                    require(devtools)
                    install_github('ramnathv/rCharts')
                
                # create a sortable and searchable data table for the airquality data set
                        d <- data.frame( airquality, stringsAsFactors=FALSE)
                

            # quiz 1 - dp : q1
                data(cars)
                
                library(manipulate)
                myPlot <- function(s) {
                    plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
                    abline(0, s)
                }
                
                # create slider for slope
                manipulate( myPlot(s), s=slider(0,2,step=0.1))