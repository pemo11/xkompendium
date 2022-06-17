// ============================================================================
// file: VarLocalVergleich.prg
// ============================================================================

#define lCore

Using System
Using System.Collections.Generic
Using System.Data
Using System.Text

Begin Namespace XKompendium

    /// <summary>
    /// The definition of the VarLocalComparison class
    /// </summary>
	Public Static Class VarLocalComparison

        /// <summary>
        /// Comparing an object with Null
        /// </summary>
        Public Static Method NullQuery() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(int)})
            ta:Columns:Add(DataColumn{"Name", typeof(string)})
            Local r := ta:newRow() As DataRow
            r["Id"] := 1000
            r["Name"] := "Pemo"
            ta:Rows:Add(r)

            r := ta:newRow()
            r["Id"] := 1001
            ta:Rows:Add(r)

            // Vergleich 1
            var r1 := ta:Select("Id = 2000")
            ? r1 == Null
            // Vergleich 2
            Local r2 := ta:Select("Id = 2000") As DataRow[]
            ? r2 == Null

            // Kann in Core nicht kompiliert werden wegen Usual
            #ifndef lCore
            Local rValue1 := ta:Select("Id=1001")[1]["Name"] As Usual
            ? rValue1 == Null
            #endif

            var rValue2 := ta:Select("Id=1001")[1]["Name"]
            ? rValue2 == Null

            var rValue3 := ta:Select("Id=1001")[1]["Name"]
            ? rValue3 Is DBNull

            return


    End Class

End Namespace