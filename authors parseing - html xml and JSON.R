### Parse HTML file to dataframe

library(XML)
library(RJSONIO)

authorsparse = readHTMLTable("authors.html")
authorsparsedf = data.frame(authorsparse)
colnames(authorsparsedf) = c("First_Name","Last_Name","Title","Genre","Published","Living_Status")
print(authorsparsedf)

### Parse XML file to dataframe
xmlauthors = xmlParse("authors.xml")
xmlrootauthors = xmlRoot(xmlauthors)
authorsxmldf = xmlToDataFrame(xmlrootauthors)
print(authorsxmldf)

### Parse JSON file to dataframe

parseauthorjson = fromJSON(content = "authors.json")
authorjsondf = do.call("rbind",lapply(parseauthorjson,data.frame,stringsAsFactors=FALSE))
rownames(authorjsondf) = c(1,2,3,4)
print(authorjsondf)


### Conclusion: The dataframes are pulled in nearly identical with minor differences in row and column naming conventions.