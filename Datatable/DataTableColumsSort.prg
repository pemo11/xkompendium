// ============================================================================
// File: DataTableColumsSort.prg
// ============================================================================

Using System.Collections.Generic
Using System.Data
Using System.Linq

Begin Namespace XKompendium
    
    /// <summary>
    /// Definition of the DataTableColumsSort class
    /// </summary>
    Class DataTableColumsSort
        
        /// <summary>
        /// Sort Datacolumns of a DataTable
        /// </summary>
        Static Method DataColumnSort() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Titel", typeof(String)})
            ta:Columns:Add(DataColumn{"Autor", typeof(String)})
            ta:Columns:Add(DataColumn{"Jahr1", typeof(String)})
            ta:Columns:Add(DataColumn{"Jahr2", typeof(String)})
            ta:Columns:Add(DataColumn{"Jahr3", typeof(String)})

            // Columns filtering per LINQ
            Local jCols := (From d As DataColumn In ta:Columns Where d:ColumnName:StartsWith("Jahr") Select d):ToList() As List<DataColumn>
            Foreach col As DataColumn In jCols
                ? col:ColumnName
            Next
            Return

    
    End Class
    
End Namespace
