// File: LINQGroupExamples.prg


Using System
Using System.Data
Using System.Linq

Begin Namespace XKompendium

    Public Static Class LINQGroupExamples
        
        // Gruppieren einer DataTable
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
            
            // Setzt Verweis auf DataSet.Extensions voraus:(
            var gebJahrGroup1 := ta:AsEnumerable():GroupBy({r => r["GebJahr"]}):ToList()
            foreach var group in gebJahrGroup1
                ? "Alle Autoren des Jahrgangs " + group:key:ToString()
                foreach var autor in group
                    ? autor["Autor"]:ToString()
                next
            next

            // Genial dank Anonymous Types
            var gebJahrGroup2 := ta:AsEnumerable():GroupBy({r => r["GebJahr"]}):Select({g => Class {Jahr:=g:Key:ToString(),Autoren:=g}}):ToList()
            foreach var autorenGruppe in gebJahrGroup2
                ? "Alle Autoren des Jahrgangs " + autorenGruppe:Jahr
                foreach var autor in autorenGruppe:Autoren
                   ? autor["Autor"]:ToString()
                next
            next

            Return
    End Class
    
End Namespace