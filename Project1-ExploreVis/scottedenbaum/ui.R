mf0 <- read.csv("mf0.csv")
library(shinydashboard)
sel_group_by = c('Individual' = 'Client.Uid',
                 'Corp Location' = 'EE.Provider',
                 'Household Formation' = 'Household.Type',
                 'Race/Ethnicity' = 'Client.Primary.Race',
                 'Gender' = 'Gender')

sel_group_by2 = c('Gender' = 'Gender',
                  'Household Formation' = 'Household.Type',
                  'Primary.Race' = 'Client.Primary.Race')

ckbox_filter = levels(mf0$Goal.Classification)
ckbox_goalOutcome = levels(mf0$Goal.Outcome)


IMG <- "RedShield.jpg"
shinyUI(dashboardPage(skin="red",
  dashboardHeader(title = "Pathway of Hope"),
  dashboardSidebar(width = 300,
      sidebarUserPanel("Salvation Army", image = IMG),
      sidebarMenu(
        menuItem("User Inputs  - Adjust Graphs Here", tabName = "Goal-Geog", icon = icon("th"),
                 checkboxGroupInput("filterbox", "Filter by Goal Categories:",
                                    choices = ckbox_filter, selected = ckbox_filter, inline = TRUE),
          menuSubItem( selectInput("selected","Select Grouping", choices=sel_group_by)
                              )),
        menuItem("About POH", tabName = "POH", icon = icon("road")),        
        menuSubItem("View Goal Analysis", tabName = "Goal-Geog", icon=icon("bar-chart")),
        menuSubItem("View Goal Classification Analysis", tabName = "Goal-Cat", icon=icon("gear")),
        tags$img(src = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRCdSDxxGEbkNQyzKbrOyKtIMJdPUx90lSvaXqAgaQP3NgOVfl5", width = 300)
        
        )#sidebarmenu 
  ),
  dashboardBody(
        tabItems(
          
          tabItem(tabName = "Goal-Cat",
                  fluidRow(column(width = 6, plotOutput("rose", width = '220%', height = '850px')))
                  ),
          
          tabItem(tabName="Goal-Geog",
                fluidRow(column(12,box(htmlOutput("hist", width = "300%", height = "600px")))
                  ),
                fluidRow(column(12, 
                            box(htmlOutput("col", width = "300%", height = "600px")))
                 )
            ),
                    
          tabItem(tabName="POH",
                  fluidRow(column(12,
                                  #box(imageOutput("image2", width=300, height=300)),
                                  #box(title = "Pathway of Hope",imageOutput("POHLogo", width = 300, height = 300), imageOutput("POHLo"))
                                 HTML('<iframe width="1280" height="720" src="https://www.youtube.com/embed/wTlzxAvUAuU?T=77" frameborder="0" allowfullscreen></iframe>') #tags$embed(src="https://www.youtube.com/embed/wTlzxAvUAuU?t=77")
                                  #box(imageOutput("imageRedShield", width = 300, height = 300))
                  ),
                  fluidRow(column(10, br(), h1(p(strong("The Salvation Army", style = "color:red; font-family: 'times'; font-si16pt")),align = "center"), h2(p(strong("Pathway of Hope", style = "font-family: 'times'; font-si16pt")), align = "center"),
                                  h3(    p("Pathway of Hope is an expert solution to families in crisis through The
                                           Salvation Army. It is targeted and intensive case management to assist
                                           families striving to break free from intergenerational poverty. The
                                           Salvation Army forms a crucial partnership with families in need. Families
                                           participating in the program possess the desire to change their situation, and are
                                           willing to share accountability with The Salvation Army for planned
                                           actions. Through achieving increased stability, these families find a newfound
                                           hope, propelling them forward on their journey to", strong(em("self-sufficiency.", style = 'color:red')), align = "center", style = "font-family: 'times'; font-si16pt"),
                                         br(),
                                         p("This analysis takes a deeper look at the initiative, running in
                                           over 25 local communities within The Salvation Army’s Eastern Territory.
                                           The in-take process individually evaluates a family in crisis, and
                                           identifies custom and critical goals ranging from securing employment to
                                           finding affordable childcare", align = "center", style = "font-family: 'times'; font-si16pt"))
                                         )
                                         )                 
                  )#tabitem2
          
              )#tabitems
    )#dashboardbody
  
  
  )))