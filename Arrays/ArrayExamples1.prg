// ArrayExamples1.prg

Using System
Using System.Data
Using System.IO
Using System.Linq

Begin Namespace XKompendium

    /// <summary>
    /// Examples for handling Arrays (part 1)
    /// </summary>
	Static Class ArrayExamples1

        Private Delegate SearchDel(i As Int) As Boolean

        Static Method DataTablePerIndexDurchlaufen() As Void
            Local ta := DataTable{"Test"} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(int)})
            ta:Columns:Add(DataColumn{"Name", typeof(string)})
            Local row := ta:NewRow() As DataRow
            row["Id"] := 1
            row["Name"] := "Pemo"
            ta:Rows:Add(row)
            row := ta:NewRow()
            row["Id"] := 2
            row["Name"] := "Susi"
            ta:Rows:Add(row)
            row := ta:NewRow()
            row["Id"] := 3
            row["Name"] := "Hansi"
            ta:Rows:Add(row)
            // Index für die Rows beginnt bei 0!
            for local i := 0 UpTo ta:Rows:Count - 1
                local name := (string)ta:Rows[i]["Name"] As String
                local id := (int)ta:Rows[i]["Id"] As Int
                ? i"Id={id} - Name={name}"
            next
            Console.ForegroundColor := ConsoleColor:Green
            // Index für die Rows beginnt bei 0!
            local ausgabe as String
            for local i := 0 UpTo ta:Rows:Count - 1
                ausgabe := ""
                for local j := 0 To ta:Rows[i]:ItemArray:Length - 1
                    local name := ta:Columns[j]:ColumnName As String
                    ausgabe += name + "=" + ta:Rows[i]:ItemArray[j+1]:ToString() + " "
                Next
                ? ausgabe
            next


        Static Method DataTableAnlegen() As Void
            Local ta := DataTable{"Test"} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(int)})
            ta:Columns:Add(DataColumn{"Name", typeof(string)})
            Local row := ta:NewRow() As DataRow
            row["Id"] := 1
            row["Name"] := "Pemo"
            ta:Rows:Add(row)
            row := ta:NewRow()
            row["Id"] := 2
            row["Name"] := "Susi"
            ta:Rows:Add(row)
            row := ta:NewRow()
            row["Id"] := 3
            Local tmpWert := ((int)row["Id"]) + 1 as int
            row["Id"] := tmpWert
            row["Name"] := "Hansi"
            ta:Rows:Add(row)

            Local treffer := ta:Select("Id > 1") As DataRow[]
            foreach row1 as DataRow in treffer
                ? row1["Name"]:ToString() + "/" + row1["Id"]:ToString()
            Next

        // Kann in Core nicht kompiliert werden
        #ifndef lCore
        Static Method ArrayScan0() As Void
            Local feld := {} As Array
            AAdd(feld, 11)
            AAdd(feld, 22)
            AAdd(feld, 33)
            AAdd(feld, 44)
            // Gibt es den Wert 33 im Array?
            ?AScan(feld, {|x|x = 33})
            // Gibt es den Wert 55 im Array?
            ?AScan(feld, {|x|x = 55})
            Return
        #endif

        // Kann in Core nicht kompiliert werden
        #ifndef lCore
        Static Method ArrayScan1() As Void
            Local feld := Array{} As Array
            Aadd(feld, {1,2,3,4,5,6,7,8,9})
            Aadd(feld, {11,22,33,44,55,66,77,88,99})
            Aadd(feld, {111,222,333,444,555,666,777,888,999})
            ? feld[1,1]
            ? feld[2,4]
            // Findet 444 an vierter Position im 3. Feld - Rückgabe folglich 3
            ?AScan(feld, {|x|x[4] = 444})
            return
        #endif

        // Kann in Core nicht kompiliert werden
        #ifndef lCore
        Static Method ArrayScan2() As Void
            Local feld := Array{} As Array
            // Local searchFunc As System.Func<Int, Logic>
            Local searchFunc := { x => x > 100 } As SearchDel
            Aadd(feld, {1,2,3,4,5,6,7,8,9})
            Aadd(feld, {11,22,33,44,55,66,77,88,99})
            Aadd(feld, {111,222,333,444,555,666,777,888,999})
            Local feld1 := {111,222,333,444,555,666,777,888,999} As Array
            // Durchsucht ein eindimensionales Array - gibt 4 zurück - aber immer nur das erste Element
            ?AScan(feld1, {|x|x > 400})
            // Alle Zahlen finden
            local z As DWord
            repeat
                z := AScan(feld1, {|x|x > 400}, z + 1)
                if z > 0
                    ? feld1[z]
                end if
            until z == 0

            return
        #endif

        // Kann in Core nicht kompiliert werden
        #ifndef lCore
        Static Method ArrayScan3() As Void
            Local Werte := {} As Array
            AAdd(Werte, {"A", 1000})
            AAdd(Werte, {"A", 2000})
            AAdd(Werte, {"B", 100})
            AAdd(Werte, {"B", 200})
            // AWerte := AScan(Werte, {|f|f[1]=="A"})
            var AWerte := (from w in Werte where w[1] == "A" select w[2]):ToList()
            For Local i := 0 UpTo AWerte:Count - 1
                ?AWerte[i]
            Next

            Return
        #endif

        // Kann in Core nicht kompiliert werden
        #ifndef lCore
        Static Method ArrayDel() As Void
            Local Werte := {} As Array
            AAdd(Werte, {"A", 1000})
            AAdd(Werte, {"B", 2000})
            AAdd(Werte, {"C", 3000})
            AAdd(Werte, {"D", 4000})
            Local wPos := AScan(Werte, {|a|a[1] = "C"}) As Dword
            // Wert wird entfernt, die oberen Werte rutschen eine Position nach unten
            ADel(Werte,wPos)
            for var i := 1 UpTo ALen(Werte)
                ? Werte[i,1]
            next
            Return
        #endif

        #ifndef lCore
        Static Method ArrayLetztesElementEntfernen() As Void
            Local aWerte := {} As Array
            AAdd(aWerte, {"A", 1000})
            AAdd(aWerte, {"B", 2000})
            AAdd(aWerte, {"C", 3000})
            AAdd(aWerte, {"D", 4000})
            // So geht es nicht, da die Array-Größe kleiner wird
            /* for var i := 1 UpTo ALen(aWerte)
                Local w = aWerte[ALen(aWerte),1] As String
                ADel(aWerte, ALen(aWerte))
                ASize(aWerte, ALen(aWerte)-1)
                ? w + " wurde gelöscht"
            next
            */
            while ALen(aWerte) > 0
                Local w := aWerte[ALen(aWerte),1] As String
                ADel(aWerte, ALen(aWerte))
                ASize(aWerte, ALen(aWerte)-1)
                ? w + " wurde gelöscht"
            End While
            Return
        #endif

        Static Method ObjectArray() As Void
            Local dok1 := Dokument{"Alles klar mit X#!"}  As Dokument
            Local dok2 := Dokument{"Alles klar mit C#!"}  As Dokument
            Local Dokumente := <Dokument>{dok1, dok2} As Dokument[]
            foreach dok As Dokument in Dokumente
                ? dok:Titel
            next
            Return

        Static Method NetArray() As Void
            // Wie werden reguläre Arrays einer bestimmten Größe definiert???
            Return

    End Class

    Class Dokument
        Public Titel As String

        Constructor (Titel As String)
            Self:Titel := Titel
            Return

    End Class


End Namespace
