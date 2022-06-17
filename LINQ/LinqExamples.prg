// ============================================================================
// file: LinqExamples.prg
// ============================================================================

#define lCore

Using System
Using System.Data
Using System.Collections.Generic
Using System.IO
Using System.Linq

Begin Namespace XKompendium

    /// <summary>
    /// The definition of the LinqExamples class
    /// </summary>
	Static Class LinqExamples

        /// <summary>
        /// Using where to filter a List<T>
        /// </summary>
        Static Method WhereExample1() As Void
            Local Werte := List<Int>{}{11,22,33,44,55,66,77,88} As List<Int>
            Var Gerade := Werte:Where({z => z % 2 == 0}):ToList()
            Foreach Var w In Gerade
                ?w
            Next

        /// <summary>
        /// Leave out the first element of an array with the skip() method
        /// </summary>
        Static Method SkipArray() As Void
            Local aZahlen := <Int32>{11,22,33,44,55} As Int32[]
            // Genial einfach, dank LINQ!
            Foreach z As int32 In aZahlen:Skip(1)
                ? z
            Next
            Return

        /// <summary>
        /// Generate a range of numbers
        /// </summary>
        Static Method RangeExample1() As Void
            // Geht noch nicht
            Local f := Action<Int>{f} As Action<Int>
            Enumerable.Range(1,12):ToList():ForEach(f)
            Return

        // Does not compile in Core due to Array type
        #ifndef lCore
        Static Method SumValues() As Void
            Local Werte := {100, 200, 303} As Array
            Var GeradeWerte := (From w In Werte Where w % 2 == 0 Select w):ToArray()
            Foreach Var w In GeradeWerte
                ?w
            Next
        #endif

        /// <summary>
        /// Sort an Array
        /// </summary>
        Static Method ArraySort() As Void
            Local l1 := List<Document>{}{ Document{3,"Titel 3"},Document{1,"Titel 1"},Document{2,"Titel 2"}} As List<Document>
            // Liste nach Id sortieren
            // Local l2 := (from d in l1 select d order by Id Descending):ToList()

            // Local l2 := l1:OrderBy({d => d:Id}) As List<Document>
            l1:OrderByDescending({d => d:Id})
            Foreach d As Document In l1
                ? d:Id
            Next

        /// <summary>
        /// Sort Datacolumns of a DataTable
        /// </summary>
        Static Method DataColumnSort() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Titel", typeof(String)})
            ta:Columns:Add(DataColumn{"Autor", typeof(String)})
            ta:Columns:Add(DataColumn{"Jahr1", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr2", typeof(string)})
            ta:Columns:Add(DataColumn{"Jahr3", typeof(string)})

            // Columns filtering per LINQ
            Local jCols := (From d As DataColumn In ta:Columns Where d:ColumnName:StartsWith("Jahr") Select d):ToList() As List<DataColumn>
            Foreach col As DataColumn In jCols
                ? col:ColumnName
            Next
            Return

        /// <summary>
        /// Get the first element with FirstOrDefault()
        /// </summary>
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
            Local rowAutor := (From r As DataRow In ta:Rows Where r["Autor"]:ToString() == "Pemo" Select r):FirstOrDefault() As DataRow
            ? rowAutor["Titel"]
            Return

        /// <summary>
        /// Example for the select() method
        /// </summary>
        Static Method SelectExample1() As Void
            Local Numbers := <Int32>{11,22,33,44,55,66,77} As Int[]
            Local Numbers2 := Numbers:Select({z => Number{z}}):ToList() As List<Number>
            Foreach z As Number In Numbers2
                ?z:Value
            Next
            Return

        /// <summary>
        /// Example for the select() method
        /// </summary>
        Static Method SelectExample2() As Void
            Local Numbers := <Object>{11,"22",33,"44",55,"66",77} As Object[]
            Local Numbers2 := Numbers:OfType<Int32>():Select({z => Number{z}}):ToList() As List<Number>
            Foreach z As Number In Numbers2
                ?z:Value
            Next
            Return

    End Class


End Namespace