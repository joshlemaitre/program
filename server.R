library(ggvis)
library(dplyr)
library(reshape2)
library(scales)
library(DT)


function(input, output, session) {
    
    on_trips <- reactive({
        subset(trips, 
           (startdate <= input$'date') & 
               (enddate >= input$'date')
        )
    })
    
    output$trips <- DT::renderDataTable(
        on_trips(),
        options = list(page_length=100, dom='t'),
        rownames = FALSE
    )
    
    output$trip_file <- DT::renderDataTable(
        subset(trip_file, (as.Date(startdate) <= input$'date') & (as.Date(enddate) >= input$'date'))
    )
    
    out_of_camp <- reactive({
        c(input$'daysoff', input$'trips')
    })
    
            
    comps <- reactive({
        subset(intercamp_file, (as.Date(startdate, format='%m/%d/%Y') >= input$'date') & (as.Date(startdate, format='%m/%d/%Y') <= input$'date'+7))
    })
    
    
    output$cur_comps <- DT::renderDataTable(
        comps(), 
        options = list(pageLength=10, dom = 't'),
        rownames = F
    )
    
    output$cab <- DT::renderDataTable(
        as.data.frame(cabins),
        options = list(pageLength=100, dom = 't'), 
        rownames=F
    )
    
    output$act <- DT::renderDataTable(
        as.data.frame(activities), 
        options = list(pageLength=100), 
        rownames=F
    )
    
    staff2 <- reactive(
        setdiff(
            staff,
            out_of_camp()
            
        )
    )
    
    output$staff2 <- renderTable(
        data.frame(
            "Available Staff" = staff2()
        ), rownames=F
    )
    
    output$act1 <- DT::renderDataTable(
    as.data.frame(activities, row.names=F),
        options = list(pageLength=100, dom = 't'),
        rownames=F
    )
    
    campus <- reactive({subset(staff_file, campus == input$'odlist')})
    
    output$campus <- DT::renderDataTable(
        campus()[c('staff','campus')],
        options = list(dom = 't', pageLength=20),
        rownames = F
    )
    
    ca_quals <- reactive({ 
        s <- subset(
            quals,
            (activity==input$'ca_act')
        )
        s2 <- subset(s, key_person %in% staff2())
        subset(s2, !(key_person %in% rv$dfnew$key_person))
    })
    
    output$act2 <- DT::renderDataTable(
        as.data.frame(activities), 
        options = list(pageLength=100, dom='t')
    )
    
    rv <- reactiveValues(dfnew=NULL)

    observeEvent(input$doAppendRows,{
        dfs <- filteredTable_selected()
        # add a running number as suffix to column names to make the columns unique
        if(is.null(rv$dfnew)){
            rv$dfnew <- dfs
        } else {
            rv$dfnew <- rbind(rv$dfnew,dfs)
        }
    })
    
    output$quals <- DT::renderDataTable(ca_quals(), rownames=F)
    
    filteredTable_selected <- reactive({
        ids <- input$quals_rows_selected
        ca_quals()[ids,]
    })
    
    output$stage<- DT::renderDataTable(
        rv$dfnew, 
        options = list(dom = 't', pageLength=100),
        rownames=F)
    
    unassigned <- reactive({
        setdiff(staff, rv$dfnew$key_person)
    })
    
    output$unassigned <- DT::renderDataTable(
        as.data.frame(unassigned()),
        rownames = F,
        options = list(dom = 't', pageLength=50)
    )
}