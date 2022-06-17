// ============================================================================
// File: DataTableBeispiele.prg
// ============================================================================

Using System
Using System.Collections.Generic
Using System.Linq
Using System.Data
Using System.Text

Begin Namespace XKompendium

	/// <summary>
    /// The definition of the DataTableExamples2 class
    /// </summary>
	Class DataTableExamples2
    
        /// <summary>
        /// Filter rows with the select method
        /// ID: XS_DataTable01
        /// </summary>
        Public Static Method TableSelectExample1() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(Int)})
            ta:Columns:Add(DataColumn{"Bez", typeof(String)})
            For Local i := 1 Upto(10)
                Local r := ta:NewRow() As DataRow
                r["id"] := i
                r["Bez"] := i"SK: {i}"
                ta:Rows:Add(r)
            Next
            Local taFilter := "Bez='SK: 5'" As String
            Local rows := ta:Select(taFilter) As DataRow[]
            Foreach r As DataRow In rows
                ? r[0]
            Next
            taFilter := "Bez like 'SK*'"
            rows := ta:Select(taFilter)
            Foreach r As DataRow In rows
                ? r[1]
            Next
            Return
        
        End Method

        /// <summary>
        /// Filter rows with the select method
        /// ID: XS_DataTable01
        /// </summary>
        Public Static Method TableSelectExample2() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(Int)})
            ta:Columns:Add(DataColumn{"Bez", typeof(String)})
            For Local i := 1 Upto(10)
                Local r := ta:NewRow() As DataRow
                r["id"] := i
                r["Bez"] := i"SK: {i}"
                ta:Rows:Add(r)
            Next
            Local taFilter := "Bez='SK: 5'" As String
            Local row := DataTableFilter(ta, taFilter) As DataRow
            If row != Null
                row["Bez"] := "!!!"
            End If
            Foreach r As DataRow In ta:Rows
                ? r[1]
            Next
            Return
        
        End Method

        /// <summary>
        /// Return the select result - row[1] or Null
        /// </summary>
        Public Static Method DataTableFilter(Ta As DataTable, Filter As String) As DataRow
            Local rows := ta:Select(Filter) As DataRow[]
            Return Iif(rows:length > 0,rows[1],Null)
            

    End Class
    
End Namespace