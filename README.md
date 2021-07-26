# PowershellScript.WriteXML
Powershell script used to parse data of parametric tool data from csv file into template XML. 

Within the script the location of the template XML is specified along witht the location of the data

It then uses the the data from the csv file to fill in specific attributes within the XML. This is then repeated for each tool in the csv file and appends the previous tool in the XML. 

At the end, any tool not assigned an id number that would prevent the file from being uploaded into the system is removed and the XML file with all of the tools is saved to a specified location.
