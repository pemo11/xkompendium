// LinqBeispiele.prg

#define lCore

Using System
Using System.Data
Using System.Collections.Generic
Using System.IO
Using System.Linq

Begin Namespace XSharpAllgemein

	Static Class LinqBeispiele

        Static Method WhereBeispiel() As Void
            Local Werte := List<Int>{}{11,22,33,44,55,66,77,88} As List<Int>
            var Gerade := Werte:Where({z => z % 2 == 0}):ToList()
            ForEach var w in Gerade
                ?w
            Next

        // Das erste Element in einem Array auslassen
        Static Method SkipArray() As Void
            Local aZahlen := <Int32>{11,22,33,44,55} As Int32[]
            // Genial einfach, dank LINQ!
            foreach z as int32 in aZahlen:Skip(1)
                ? z
            next
            Return

        Static Method RangeBeispiel() As Void
            // Geht noch nicht
            Local f := Action<int>{f} As Action<int>
            Enumerable.Range(1,12):ToList():ForEach(f)
            return

        // Kann in Core nicht kompiliert werden wegen Array
        #ifndef lCore
        Static Method SumValues() As Void
            Local Werte := {100, 200, 303} As Array
            var GeradeWerte := (from w in Werte where w % 2 == 0 select w):ToArray()
            ForEach var w in GeradeWerte
                ?w
            Next
        #endif

        Static Method ArraySort() As Void
            Local l1 := List<Document>{}{ Document{3,"Titel 3"},Document{1,"Titel 1"},Document{2,"Titel 2"}} As List<Document>
            // Liste nach Id sortieren
            // Local l2 := (from d in l1 select d order by Id Descending):ToList()

            // Local l2 := l1:OrderBy({d => d:Id}) As List<Document>
            l1:OrderByDescending({d => d:Id})
            ForEach d As Document in l1
                ? d:Id
            Next

        Static Method DataColumnSort() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Titel", typeof(string)})
            ta:Columns:Add(DataColumn{"Autor", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr1", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr2", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr3", typeof(string)})

            // Spalten per LINQ filtern
            Local jCols := (from d As DataColumn in ta:Columns where d:ColumnName:StartsWith("Jahr") select d):ToList() As List<DataColumn>
            ForEach col As DataColumn in jCols
                ? col:ColumnName
            Next
            return

        Static Method FirstElement() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Titel", typeof(string)})
            ta:Columns:Add(DataColumn{"Autor", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr1", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr2", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr3", typeof(string)})

            // Ein paar Zeilen anlegen
            Local row As DataRow
            row := ta:NewRow()
            row["Titel"] := "Alles klar mit C#"
            row["Autor"] := "Pemo"
            row["Jahr1"] := 2020
            ta:Rows:Add(row)

            row := ta:NewRow()
            row["Titel"] := "VB über alles"
            row["Autor"] := "Pemo"
            row["Jahr1"] := 2000
            ta:Rows:Add(row)

            row := ta:NewRow()
            row["Titel"] := "Alles klar mit X#"
            row["Autor"] := "Susi"
            row["Jahr1"] := 2020
            ta:Rows:Add(row)

            // Spalten per LINQ filtern
            Local rowAutor := (from r As DataRow in ta:Rows where r["Autor"]:ToString() == "Pemo" select r):FirstOrDefault() As DataRow
            ? rowAutor["Titel"]
            Return

        Static Method SelectBeispiel1() As Void
            Local Zahlen := <Int32>{11,22,33,44,55,66,77} As Int[]
            Local Zahlen2 := Zahlen:Select({z => Zahl{z}}):ToList() As List<Zahl>
            foreach z As Zahl in Zahlen2
                ?z:Wert
            next
            Return

        Static Method SelectBeispiel2() As Void
            Local Zahlen := <Object>{11,"22",33,"44",55,"66"    ,77} As Object[]
            Local Zahlen2 := Zahlen:OfType<Int32>():Select({z => Zahl{z}}):ToList() As List<Zahl>
            foreach z As Zahl in Zahlen2
                ?z:Wert
            next
            Return

    End Class

    Class Zahl
        Private _Wert As Int

        Constructor(Wert As Int)
            Self:_Wert := Wert
            return

        Property Wert As Int
            Get
                return _Wert
            end get
        End property

    End Class

End Namespace