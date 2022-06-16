// ============================================================================
// File: DBServer.prg
// ============================================================================

Using System
Using System.IO

Using VO

Begin Namespace XKompendium

	/// <summary>
    /// DBServer-Beispiele
    /// </summary>
	Public Static Class DBServerExamples
    
        /// <summary>
        /// Example for Fieldput
        /// </summary>
        Public Static Method DBBeispiel1() As Void
            Local dbPfad := Path.Combine(Environment.CurrentDirectory, "Dokument2.dbf") As String
            Local oTest := DBServer{dbPfad,,,"DBFCDX"} As DBServer
            oTest:Append()
            ?oTest:RecNo
            oTest:FIELDPUT("DokName","Dok1")
            oTest:FIELDPUT("Autor","Pemo")
            oTest:Append()
            ?oTest:RecNo
            oTest:FIELDPUT("DokName","Dok2")
            oTest:FIELDPUT("Autor","Pemo")
            oTest:Append()
            ?oTest:RecNo
            oTest:FIELDPUT("DokName","Dok3")
            oTest:FIELDPUT("Autor","Pemo")
            ? i"{oTest:RecCount}  Datensätze sind in der Datenbank enthalten..."
            oTest:Close()

            Return

        /// <summary>
        /// Example for Fieldget, Skip
        /// </summary>
        Public Static Method DBBeispiel2() As Void
            Local dbPfad := Path.Combine(Environment.CurrentDirectory, "Dokument2.dbf") As String
            Local oTest := DBServer{dbPfad,,,"DBFCDX"} As DBServer
            While !oTest:EoF
                ? oTest:FIELDGET("DokName")
                oTest:Skip()
            End While
            oTest:Close()

            Return

        /// <summary>
        /// Example for Seek
        /// </summary>
        Public Static Method DBBeispiel3() As Void
            Local dbPfad := Path.Combine(Environment.CurrentDirectory, "Books.dbf") As String
            Local oTest := DBServer{dbPfad,,,"DBFCDX"} As DBServer
            oTest:GoTop()
            oTest:SetOrder("ID")
            ? oTest:RecCount
            ? oTest:RecNo
            ? AllTrim(oTest:FIELDGET(#AUTHOR))
            Local strSuch := "Alles" As String
            // Es wird das Keyfeld durchsucht (können es auch mehrere sein?)
            Local Result := oTest:Seek(strSuch) As Usual
            ? Result
            

            Return

    End Class

End Namespace
