// File: XLinqBeispiele.prg

Using System
Using System.Collections.Generic
Using System.Linq
Using System.Xml.Linq

Begin Namespace XSharpAllgemein

	Static Class XLinqBeispiele
        
        Static Private Method GetXDoc() As XDocument
            Local xmlText := "" As String
            xmlText += "<?xml version='1.0' encoding='ISO-8859-1'?>"
            xmlText += "<books>"
            xmlText += "<book id='1000' pubYear='2010'>"
            xmlText += "<author>Pemo</author>"
            xmlText += "<title>Alles klar mit X#</title>"
            xmlText += "</book>"
            xmlText += "<book id='1001' pubYear='2012'>"
            xmlText += "<author>Susi</author>"
            xmlText += "<title>X#? Ohne mich</title>"
            xmlText += "</book>"
            xmlText += "</books>"
            return XDocument.Parse(xmlText)
            
        Static Method XDocBeispiel1() As Void
            Local xDoc := GetXDoc() As XDocument
            // Ausgabe aller Autoren
            var autoren := xDoc:Descendants("author")
            foreach autor As XElement in autoren
                ? autor:Value
            next
            
            Return

        Static Method XDocBeispiel2() As Void
            Local xDoc := GetXDoc() As XDocument
            // Anhängen eines Knoten
            Local xBook := XElement{"book", XAttribute{"id","1003"}, XAttribute{"pubYear", "2000"},;
             XElement{"author", "Susi"}, XElement{"title", "X# - ein Satz mit X"}} As XElement
            xDoc:Element("books"):Add(xBook)
            ? xDoc:ToString()
            
            Return
            
        Static Method XDocBeispiel3() As Void
            Local xDoc := GetXDoc() As XDocument
            // Aktualisieren eines Knoten
            Local xb := Null As XElement
            Local xBook := (from book in xDoc:Descendants("book") where book:Attribute("id"):Value == "1001" select book):SingleOrDefault() As XElement
            if xBook != Null
                xBook:Attribute("pubYear"):Value := "2021"
                ? xDoc:ToString()
            Else
                ? "Not found"
            EndIf
            
            Return
        
        Static Private Method FindBook(Id As String, XDoc As XDocument) As XElement
            Local xBook As XElement
            xBook := (from book in xDoc:Descendants("book") where book:Attribute("id"):Value == Id select book):SingleOrDefault()
            Return xBook
        
        Static Method XDocBeispiel4() As Void
            Local xDoc := GetXDoc() As XDocument
            // Aktualisieren eines Knoten
            Local xBook := FindBook("1002", xDoc) As XElement
            if xBook != Null
                xBook:Attribute("pubYear"):Value := "2021"
            Else
                Local xBookNeu := XElement{"book", XAttribute{"id","1002"}, XAttribute{"pubYear","2020"},;
                 XElement{"author","susi"}, XElement{"title","X# - ein ganz dreister Bluff"}} As XElement
                xDoc:Element("books"):Add(xBookNeu)
            EndIf
            ? xDoc:ToString()
            xBook := FindBook("1002", xDoc)
            xBook:Attribute("pubYear"):Value := "2021"
            ? xDoc:ToString()
            Return

End Class

End Namespace
