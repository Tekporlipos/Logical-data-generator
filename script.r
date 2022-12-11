#load the data in csv format
data = read.csv(file = file.choose(), header=FALSE)
#view the content of the data
View(data)

#this function format the fields and table name to appropriate name
checkString <- function(str) {
  return(gsub("[,. -]", "_",  str))
}


#Note: The content in the file will be overwritten  (recommend file: txt)
sink(file = file.choose());

#loop through the csv file one be one and format crate the database

for(a in 1:length(data[,1])){
  table <- "";
  if(data[a,2]== "" && data[a,1] != ""){
    table =   paste(table,"Table ");
    table =   paste(table,"Data2.");
    table =   paste(table, checkString(data[a,1]));
    table =   paste(table," {");
  } else if(data[a,1] == "Field"){
    next;
  }else if(data[a,1] != "Field" && data[a,1] != ""){
    table =   paste(table, checkString(data[a,1]));
    table =   paste(table," ");
    table =   paste(table, data[a,2]);
    
    if(data[a,3] == "NO"){
      table =   paste(table," ");
      table =   paste(table, "[pk]");
    }
    
  }else if(data[a,1] == ""){
    table =   paste(table,"} ");
  }
  cat(table)
  cat("\n")
}
#close sink after the loops
sink()





