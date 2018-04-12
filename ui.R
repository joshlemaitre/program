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
            tableOutput('staff2')
        ),
        mainPanel(
            tabsetPanel(
                tabPanel(
                    title="Duty Roster",
                    titlePanel("Duty Roster"),
                    fluidRow(
                        column(6,
                            selectizeInput(
                                "trips", 
                                label="Trip Staff", 
                                multiple=T, 
                                choices=staff
                            ),
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
                            ),
                            selectizeInput(
                                "cod", 
                                label="COD", 
                                multiple=F, 
                                choices=staff_file$staff[which(staff_file$senior == T)]
                            )
                        ),
                        column(6, 
                            selectizeInput(
                                "lod", 
                                label="LOD", 
                                multiple=F, 
                                choices=subset(staff_file, campus == "L")$staff
                            ),
                            selectizeInput(
                                "mod", 
                                label="MOD", 
                                multiple=F, 
                                choices=subset(staff_file, campus == "M")$staff
                            ),
                            selectizeInput(
                                "cq", 
                                label="CQ", 
                                multiple=F, 
                                choices=subset(staff_file, campus == "U")$staff
                            ),
                            selectizeInput(
                                "wod", 
                                label="WOD", 
                                multiple=F, 
                                choices=subset(staff_file, lifeguard == 1)$staff
                            ),
                            selectizeInput(
                                "rlg", 
                                label="RLG", 
                                multiple=F, 
                                choices=subset(staff_file, lifeguard == 1)$staff
                            )
                        )
                    ),
                    h5("Trips"),
                    DT::dataTableOutput('trip_file')
                ),
                tabPanel(
                    title="Intercamp",
                    h4('Intercamp Competitions This Week'),
                    DT::dataTableOutput('cur_comps')
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
                    h4("Unassigned Staff"),
                    DT::dataTableOutput('unassigned'),
                    h4("Staged Assignments"),
                    DT::dataTableOutput('stage')
                )
            )
        )
    )
)
