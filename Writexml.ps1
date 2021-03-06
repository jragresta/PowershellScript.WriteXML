	#Path of blank XML format
$path = "C:\Users\agresta\Desktop\LOLI.xml"

	#Path of data in .csv format
$csvPath = "F:\H Drive\DatabaseProjects\Hirsh P.835903\csv tool files\UNDERCUT.csv"

	#This formats the XML into something you can edit
[XML]$Content = (Get-Content -Path $path)

#saying that for each variable in the csv file, it should do the following
foreach($e in(Import-Csv -Path $csvPath))
{
	#the nodes that stay the same each time, in this case it is Data, Tool. So for the start of each variable, it will write Data and Tool
$ComponentNode = @($Content.Data.Component)[-1].Clone()

$ComponentNode.ComponentId=$e.IDNO
$ComponentNode.ExternalDocument.ExternalDocumentList.Document.DocumentUri=$e.link
#$ComponentNode.GraphicFile= $e.GraphicFile1
$ComponentNode.Description=$e.des
$ComponentNode.SubjectNo=$e.Location
$ComponentNode.Comment=$e.Comment
$ComponentNode.Characteristic.DC=$e.DC
$ComponentNode.Characteristic.DN=$e.DN
$ComponentNode.Characteristic.DCONMS=$e.DCONMS
$ComponentNode.Characteristic.APMX=$e.APMX
$ComponentNode.Characteristic.LH=$e.LH
$ComponentNode.Characteristic.LPR=$e.LPR
$ComponentNode.Characteristic.LS=$e.LS
$ComponentNode.Characteristic.OAL=$e.OAL
$ComponentNode.Characteristic.PRFRAD1=$e.PRFRAD1
$ComponentNode.Characteristic.LPRFRRAD1=$e.PRFRAD1
$ComponentNode.Characteristic.PRFRAD2=$e.PRFRAD1
$ComponentNode.Characteristic.ZEFP=$e.ZEFP
$ComponentNode.Characteristic.DN=$e.DN
$ComponentNode.Characteristic.APMX=$e.APMX
$ComponentNode.Characteristic.PL=$e.PL
$ComponentNode.Characteristic.RE=$e.RE
$ComponentNode.Characteristic.PLGL=$e.PLGL
$ComponentNode.Characteristic.COATN=$e.COATN
$ComponentNode.Characteristic.CNSC=$e.CNSC
$ComponentNode.Characteristic.CXSC=$e.CNSC
$ComponentNode.Characteristic.ZEFP=$e.ZEFP
$ComponentNode.Characteristic.PRFA=$e.PRFA
$ComponentNode.Characteristic.CZCMS=$e.CZCMS
$ComponentNode.Characteristic.SIG1=$e.SIG1
$ComponentNode.Characteristic.CNSC=$e.CNSC
$ComponentNode.Characteristic.CXSC=$e.CXSC
	
	#this line tells it to write the next xml after the previous one
$Content.Data.AppendChild($ComponentNode)
} 
$RemoveEmpty= $Content.data.Component| Where-Object {$_.ComponentId -eq "$null"}
$Content.data.RemoveChild($RemoveEmpty)

	#this tells it to then save what it has written in the specified location.
$Content.Save("D:\Downloads\HIRSH_UNDERCUT.xml")

