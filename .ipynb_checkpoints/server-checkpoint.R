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
        trip_file
    )
    
    output$intercamp_file <- DT::renderDataTable(
        intercamp_file
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
    
    output$staff1 <- DT::renderDataTable(
        as.data.frame(staff), 
        options = list(pageLength=100),
        rownames=F
    )
    
    staff2 <- reactive(
        setdiff(
            setdiff(
                staff,
                input$'daysoff'
            ), 
            on_trips()$staff
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
    
    output$stage<- DT::renderDataTable(rv$dfnew, rownames=F)
    
    
}