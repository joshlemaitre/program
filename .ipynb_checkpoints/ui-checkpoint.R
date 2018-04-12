library(shiny)
library(ggplot2)
library(scales)


fluidPage(
    titlePanel("Program"),
    sidebarLayout(
        sidebarPanel(
            titlePanel("Input Parameters"),
            dateInput(
                "date", 
                "Date", 
                value = Sys.Date() + 1
            ),
            DT::dataTableOutput('trips'),
            tableOutput('staff2')
        ),
        mainPanel(
            tabsetPanel(
                tabPanel(
                    title="Time Off",
                    selectizeInput(
                        "daysoff", 
                        label="Days Off", 
                        multiple=T,
                        choices = staff
                    ),
                    selectizeInput(
                        "eno", 
                        label="ENO", 
                        multiple=T, 
                        choices=staff
                    )
                ),
                tabPanel(
                    title="Trips",
                    DT::dataTableOutput('trip_file')
                ),
                tabPanel(
                    title="ODs",
                    selectInput(
                        'odlist', 
                        label="Campus", 
                        choices=c("LOD","MOD","CQ","COD")
                    )
                ),
                tabPanel(
                    title="Intercamp",
                    DT::dataTableOutput('intercamp_file')
                ),
                tabPanel(
                    title="Lifeguards"
                ),
                tabPanel(
                    title="Assign Activities",
                    titlePanel("Assign Activities"),
                    column(width=4,
                           selectInput(
                               "period", 
                               "Activity Period", 
                               choices=c(
                                   "Cabin Assigned",
                                   "Specialty",
                                   "General Swim 1",
                                   "1st Optional",
                                   "2nd Optional",
                                   "General Swim 2",
                                   "Evening"
                               )
                           ),
                           selectInput(
                               "ca_act", 
                               label="Activity", 
                               choices = activities,
                               selected = NULL
                           )
                    ),
                    column(width=8, 
                           DT::dataTableOutput('quals')
                    ),
                    actionButton(
                        "doAppendRows", 
                        "Stage Assignments"
                    ),
                    DT::dataTableOutput('stage')
                )
            )
        )
    )
)
