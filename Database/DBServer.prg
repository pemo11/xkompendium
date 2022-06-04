// ============================================================================
// File: DBServer.prg
// Beispiele zu DBServer
// Creation Date : 19.08.2021 08:10:00
// ============================================================================

Using System
Using System.IO

Using VO

Begin Namespace XSharpAllgemein

	/// <summary>
    /// DBServer-Beispiele
    /// </summary>
	Public Static Class DBServerBeispiele

        // Beispiel für Fieldput
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

        // Beispiel für Fieldget, Skip
        Public Static Method DBBeispiel2() As Void
            Local dbPfad := Path.Combine(Environment.CurrentDirectory, "Dokument2.dbf") As String
            Local oTest := DBServer{dbPfad,,,"DBFCDX"} As DBServer
            While !oTest:EoF
                ? oTest:FIELDGET("DokName")
                oTest:Skip()
            End While
            oTest:Close()

            Return

        // Beispiel für Seek
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
