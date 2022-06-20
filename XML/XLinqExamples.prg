// ============================================================================
// File: XLinqExamples.prg
// ============================================================================

Using System
Using System.Collections.Generic
Using System.Linq
Using System.Xml.Linq

Begin Namespace XKompendium

    /// <summary>
    /// XLinqExamples class
    /// </summary>
	Static Class XKompendium
        
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
            
        /// <summary>
        /// Get all author elements as decendants
        /// </summary>
        Static Method XDocBeispiel1() As Void
            Local xDoc := GetXDoc() As XDocument
            // Ausgabe aller Autoren
            Var autoren := xDoc:Descendants("author")
            Foreach autor As XElement In autoren
                ? autor:Value
            Next
            
            Return

        /// <summary>
        /// Add an author element with Attributes
        /// </summary>
        Static Method XDocBeispiel2() As Void
            Local xDoc := GetXDoc() As XDocument
            // Anhängen eines Knoten
            Local xBook := XElement{"book", XAttribute{"id","1003"}, XAttribute{"pubYear", "2000"},;
             XElement{"author", "Susi"}, XElement{"title", "X# - a sentence with a X"}} As XElement
            xDoc:Element("books"):Add(xBook)
            ? xDoc:ToString()
            
            Return

        /// <summary>
        /// Update a book node
        /// </summary>
        Static Method XDocBeispiel3() As Void
            Local xDoc := GetXDoc() As XDocument
            // Locate the book element
            Local xBook := (From book In xDoc:Descendants("book") Where book:Attribute("id"):Value == "1001" Select book):SingleOrDefault() As XElement
            If xBook != Null
                xBook:Attribute("pubYear"):Value := "2021"
                ? xDoc:ToString()
            Else
                ? "Not found"
            EndIf
            
            Return
        
        /// <summary>
        /// Find a book element by its id
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="XDoc"></param>
        /// <returns></returns>
        Static Private Method FindBook(Id As String, XDoc As XDocument) As XElement
            Local xBook As XElement
            xBook := (From book In xDoc:Descendants("book") Where book:Attribute("id"):Value == Id Select book):SingleOrDefault()
            Return xBook

        /// <summary>
        /// Update a book node
        /// </summary>
        Static Method XDocBeispiel4() As Void
            Local xDoc := GetXDoc() As XDocument
            // Find the book node first
            Local xBook := FindBook("1002", xDoc) As XElement
            If xBook != Null
                xBook:Attribute("pubYear"):Value := "2021"
            Else
                Local xBookNew := XElement{"book", XAttribute{"id","1002"}, XAttribute{"pubYear","2020"},;
                 XElement{"author","susi"}, XElement{"title","X# - a sensational language"}} As XElement
                xDoc:Element("books"):Add(xBookNew)
            Endif
            ? xDoc:ToString()
            xBook := FindBook("1002", xDoc)
            xBook:Attribute("pubYear"):Value := "2021"
            ? xDoc:ToString()
            Return

    End Class

End Namespace
