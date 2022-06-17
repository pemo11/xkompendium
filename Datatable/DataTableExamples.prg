// ============================================================================
// File: DataTableExamples.prg
// ============================================================================

Using System.Data

Begin Namespace XKompendium

	/// <summary>
    /// The definition of DataTableExamples class
    /// </summary>
	Class DataTableExamples

        /// <summary>
        /// ID: XS_DataTable01
        /// Creates a new datatable, add some rows and outputs them
        /// </summary>
        Static Method DataTableOutputByIndex() As Void
            Local ta := DataTable{"Test"} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(Int)})
            ta:Columns:Add(DataColumn{"Name", typeof(String)})
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
            // Index for the rows starts at 0!
            For Local i := 0 Upto ta:Rows:Count - 1
                Local name := (String)ta:Rows[i]["Name"] As String
                Local id := (Int)ta:Rows[i]["Id"] As Int
                ? i"Id={id} - Name={name}"
            Next
            Console.ForegroundColor := ConsoleColor:Green
            // Index for the rows starts at 0!
            Local ausgabe As String
            For Local i := 0 Upto ta:Rows:Count - 1
                ausgabe := ""
                For Local j := 0 To ta:Rows[i]:ItemArray:Length - 1
                    Local name := ta:Columns[j]:ColumnName As String
                    ausgabe += name + "=" + ta:Rows[i]:ItemArray[j+1]:ToString() + " "
                Next
                ? ausgabe
            Next

        /// <summary>
        /// ID: XS_DataTable02
        /// Creates a new datatable, add some rows and select a few and output them
        /// </summary>
        Static Method DataTableSelect() As Void
            // Create an empty datatable
            Local ta := DataTable{"Test"} As DataTable
            // Add two columns
            ta:Columns:Add(DataColumn{"Id", typeof(Int)})
            ta:Columns:Add(DataColumn{"Name", typeof(String)})
            // Add a few rows
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
            Local tmpWert := ((Int)row["Id"]) + 1 As Int
            row["Id"] := tmpWert
            row["Name"] := "Hansi"
            ta:Rows:Add(row)
            
            // Select all the rows with id > 1
            Local results := ta:Select("Id > 1") As DataRow[]
            // Enumerate all rows - the loop variable can be explicitly typed or just vared
            // Foreach row1 As DataRow In results
            Foreach Var row1 In results
                ? row1["Name"]:ToString() + "/" + row1["Id"]:ToString()
            Next

	End Class
    
End Namespace