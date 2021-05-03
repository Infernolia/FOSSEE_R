df <- read.csv("C:/Users/Aboli/Desktop/tmp/FOSSEE/Code/jmol/cleaned_data.csv")


df <- subset(df,select = -c(1))


`Temp1` <- which(df$Jmol_3D_Modelling_Knowledge_Before>3)
`Temp2` <- which(df$Jmol_3D_Modelling_Knowledge_After<=3)
`Temp3` <- intersect(`Temp1`,`Temp2`)

`Temp4` <- which(df$Jmol_3D_Model_Create_Edit_Knowledge_Before>3)
`Temp5` <- which(df$Jmol_3D_Model_Create_Edit_Knowledge_After<=3)
`Temp6` <- intersect(`Temp4`,`Temp5`)

`Temp7` <- which(df$Jmol_Bond_Measure_Knowledge_Before>3)
`Temp8` <- which(df$Jmol_Bond_Measure_Knowledge_After<=3)
`Temp9` <- intersect(`Temp7`,`Temp8`)

`Temp10` <- which(df$Jmol_Orbital_Create_Knowledge_Before>3)
`Temp11` <- which(df$Jmol_Orbital_Create_Knowledge_After<=3)
`Temp12` <- intersect(`Temp10`,`Temp11`)

`Temp13` <- which(df$Jmol_CenterAxis_Knowledge_Before>3)
`Temp14` <- which(df$Jmol_CenterAxis_Knowledge_After<=3)
`Temp15` <- intersect(`Temp13`,`Temp14`)


`Temp16` <- which(df$Jmol_PointGroups_Knowledge_Before>3)
`Temp17` <- which(df$Jmol_PointGroups_Knowledge_After<=3)
`Temp18` <- intersect(`Temp16`,`Temp17`)

`Temp19` <- which(df$Jmol_Script_Cmd_3D_Knowledge_Before>3)
`Temp20` <- which(df$Jmol_Script_Cmd_3D_Knowledge_After<=3)
`Temp21` <- intersect(`Temp19`,`Temp20`)

`Temp22` <- which(df$Jmol_Crystal_Knowledge_Before>3)
`Temp23` <- which(df$Jmol_Crystal_Knowledge_After<=3)
`Temp24` <- intersect(`Temp22`,`Temp23`)

`Temp25` <- which(df$New_Knowledge>3)
`Temp26` <- which(df$Not_Learn_Much<=3)
`Temp27` <- intersect(`Temp25`,`Temp26`)

`Temp28` <- which(df$Quality_Workshop>3)
`Temp29` <- which(df$Unhappy_Format<=3)
`Temp30` <- intersect(`Temp28`,`Temp29`)



# Union of all row entries with inappropriate values
`Row entries` <- sort(union(union(union(union(union(union(union(union(`Temp3`,`Temp6`),`Temp9`),`Temp12`),`Temp15`),`Temp21`),`Temp24`),`Temp27`),`Temp30`))
df <- df[-`Row entries`,]


View(df)