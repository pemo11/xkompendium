// ============================================================================
// file: LINQDataColumn.prg
// ============================================================================

Using System
Using System.Collections.Generic
Using System.Data
Using System.Linq
Using System.Text

Begin Namespace XKompendium

    /// <summary>
    /// Definition of the LINQDataColumn class
    /// </summary>
	Public Static Class LINQDataColumn
    
        /// <summary>
        /// Sort columns of a DataTable
        /// </summary>
        Public Static Method SortColumns1() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"A1",typeof(String)})
            ta:Columns:Add(DataColumn{"A2",typeof(String)})
            ta:Columns:Add(DataColumn{"B",typeof(String)})
            Var aColumns := (From d As DataColumn In ta:Columns Where d:ColumnName:StartsWith("A") Orderby d:ColumnName Descending Select d):ToList() // As List<DataColumn>
            Foreach Var col In aColumns
                 ? col:ColumnName
            Next
 
        /// <summary>
        /// Sort columns of a DataTable
        /// </summary>
        Public Static Method SortColumns2() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"A1",typeof(String)})
            ta:Columns:Add(DataColumn{"A2",typeof(String)})
            ta:Columns:Add(DataColumn{"B",typeof(String)})
            //  Orderby d:ColumnName Descending Select d)
            // Geht nicht, da Columns eine DataColumnCollection ist und kein Where besitzt?
            // Var aColumns := ta:Columns:ToList():Where({d As DataColumn => d:ColumnName:StartsWith("A")}):ToList() // As List<DataColumn>
            // Foreach Var col In aColumns
            //      ? col:ColumnName
            // Next


    End Class

End Namespace

