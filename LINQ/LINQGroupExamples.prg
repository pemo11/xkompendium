// ============================================================================
// file: LINQGroupExamples.prg
// ============================================================================

Using System
Using System.Data
Using System.Linq

Begin Namespace XKompendium

    /// <summary>
    /// Definition of the LINQGroupExamples class
    /// </summary>
    Public Static Class LINQGroupExamples
        
        /// <summary>
        /// Grouping of a DataTable
        /// </summary>
        Static Method DataTableGroup() As Void
            Local ta := DataTable{"Test"} As DataTable
            ta:Columns:Add(DataColumn{"Id",typeof(Int32)})
            ta:Columns:Add(DataColumn{"Autor",typeof(string)})
            ta:Columns:Add(DataColumn{"GebJahr",typeof(Int32)})
            
            Local row := ta:NewRow() As DataRow
            row["Id"] := 1
            row["Autor"] := "Susi"
            row["GebJahr"] := 1950
            ta:Rows:Add(row)
            row := ta:NewRow()
            row["Id"] := 2
            row["Autor"] := "Pemo"
            row["GebJahr"] := 1961
            ta:Rows:Add(row)
            row := ta:NewRow()
            row["Id"] := 3
            row["Autor"] := "Homa"
            row["GebJahr"] := 1950
            ta:Rows:Add(row)
            
            // Requires reference to the DataSet.Extensions assembly
            Var gebJahrGroup1 := ta:AsEnumerable():GroupBy({r => r["GebJahr"]}):ToList()
            Foreach Var group In gebJahrGroup1
                ? "Alle Autoren des Jahrgangs " + Group:key:ToString()
                Foreach Var autor In Group
                    ? autor["Autor"]:ToString()
                Next
            Next

            // Very simple thanks to anonymous types
            Var gebJahrGroup2 := ta:AsEnumerable():GroupBy({r => r["GebJahr"]}):Select({g => Class {Jahr:=g:Key:ToString(),Autoren:=g}}):ToList()
            Foreach Var autorenGruppe In gebJahrGroup2
                ? "Alle Autoren des Jahrgangs " + autorenGruppe:Jahr
                foreach var autor in autorenGruppe:Autoren
                   ? autor["Autor"]:ToString()
                next
            next

            Return
    End Class
    
End Namespace