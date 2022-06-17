// ============================================================================
// File: DataTableLinq.prg
// ============================================================================

Using System
Using System.Collections.Generic
Using System.Data
Using System.Linq
Using System.Text

Begin Namespace XKompendium

	/// <summary>
    /// The definition of the DataTableLing class
    /// </summary>
	Class DataTableLinq

        /// <summary>
        /// Uses LINQ and FoReach to access each row of a DataTable
        /// ID: XS_DataTable01
        /// </summary>
        Public Static Method TableForEachBeispiel1() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(Int)})
            ta:Columns:Add(DataColumn{"State", typeof(Boolean)})
            For Local i := 1 Upto(10)
                Local r := ta:NewRow() As DataRow
                r["id"] := i
                ta:Rows:Add(r)
            Next
            // Set all state columns to true
            // a Cast<> ist needed for being able to use the ToList() method
            // Only a List<T> has a ForEach() method
            // A little to much casting but it works;)
            ta:Rows:Cast<DataRow>():ToList():ForEach({r => r["State"] := False})

            Foreach r As DataRow In ta:Rows
                ? r["State"]
            Next
            Return

        End Method

        /// <summary>
        /// Example for the skip-Method
        /// ID: XS_DataTable01
        /// </summary>
        Public Static Method SkipColumn() As Void
            Local ta := DataTable{"tab1"} As DataTable
            ta:Columns:Add(DataColumn{"Spalte1", typeof(String)})
            ta:Columns:Add(DataColumn{"Spalte2", typeof(String)})
            ta:Columns:Add(DataColumn{"Spalte3", typeof(String)})
            // Cast<DataColumn> needed otherwise skip() is an unknown member
            Foreach col As DataColumn In ta:Columns:Cast<DataColumn>():Skip(1)
                ? col:ColumnName
            Next

    End Class

End Namespace