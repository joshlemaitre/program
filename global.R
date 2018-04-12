activities = c("ARCHERY", "ARTS & CRAFTS", "BASEBALL",
               "BASKETBALL", "BOATING", "CHALLENGE",
               "FISHING", "FOOTBALL", "FRISBEE",
               "KICKBALL", "LACROSSE", "LAWN GAMES",
               "MUSIC", "PHOTOGRAPHY", "RANGER TRAIL",
               "RIFLERY", "SAILING", "SMALL CRAFT",
               "SOCCER", "SPORTS TRAINING", "SWIMMING", 
               "TENNIS", "VOLLEYBALL", "WINDSURFING",
               "WOODSHOP", "Activity Check", "LIFEGUARD TOWER")

cabins = c('Mason','Yale','Lang','Trinity',
           'Cargill','Penn','Bowdoin','Columbia',
           'Amhearst','Princeton','Otyokwa',
           'Wesleyan','Harvard','Springfield',
           'Bates','Colby','Dartmouth','Williams',
           'Cornell','Brown','Outpost','Accomack')


staff <- c("'Bos'n' Bergreen", "'Sparks' Chai", 
           "'FM' Dinsmore", "'Striker' Ewig", 
           "'Yeoman' Ilsley", "'Colonel' Jepson", 
           "'Cruiser' Leyden", "'Coach' Madariaga", 
           "'Skipper' Merz", "'Chips' Murray", 
           "'Ace' Reidy", "'Cox'n' Webel", 
           "'Boomer' Arnott", "'Swampy' Barnard", 
           "'Coach' Barnard", "'Mode' Bechler", 
           "'Dodger' Bustos Diaz", "'Ranger' Cobbold",
           "'Inspector' Colesby", "'Sparks' French", 
           "'General' Greer", "'Sarge' Hauge", 
           "'Commish' Hingst", "'Mode' McQuilling", 
           "'Corp' Morse", "'Slugger' Selassie", 
           "'Scout' Sopp", "'Ranger' Wilson", 
           "'AM' Woolridge", "'Doc' Crawley", 
           "'Inspector' Jablonski","'Bowman' Linnenbank",
           "'Dusty' McEwen", "'Guide' Scheerer", 
           "'Sarge' Spence", "'Trapper' White", 
           "'Swampy' Williams", "Will Bradley", 
           "Sean Greatorex", "Phil O'Brien", 
           "Harry Philbrick", "Louis Geller", 
           "Will Przedpelski", "Robel Selassie", 
           "Mickey Feeney", "'Yeoman' French", 
           "'Schparks' Scheerer", "Will Nash", 
           "Connor Murray", "'Coach' Rodriguez", 
           "'Scout' Plaut", "'Chief' Calhoun", 
           "'Capt' Estes", "'Ensign' Gregg", 
           "'Mander' Malm", "'SuperCoach' Hogan", 
           "'Admiral' Hogan", "'Corp' Waller", 
           "'Cruiser' Hayes", "'Colonel' Connolly", 
           "'Guide' O'Rourke")

quals <- read.csv("~/Documents/Personal/agawam/program/quals.csv")

evening_activities <- c("Pom Pom Pullaway", "Buzz Ball", "Cops and Robbers", "Frisbee Tag", "Ultimate Frisbee", "Music in Governor Hall")

trips <- data.frame(startdate=Sys.Date(),enddate=as.Date("2018-07-16"), staff="'Sarge' Spence", trip="Washington 1")

trip_file <- read.csv("~/Documents/Personal/agawam/program/Trips_2017.csv")

intercamp_file <- read.csv("~/Documents/Personal/agawam/program/intercamp.csv")

staff_file <- read.csv("~/Documents/Personal/agawam/program/staff.csv")
