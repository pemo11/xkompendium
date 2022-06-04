// File: LINQDataColumn.prg

USING System
USING System.Collections.Generic
USING System.Text
Using System.Linq
Using System.Data

BEGIN NAMESPACE XSharpAllgemein

	Public Static Class LINQDataColumn
    
        Public Static Method SortColumns1() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"A1",typeof(String)})
            ta:Columns:Add(DataColumn{"A2",typeof(String)})
            ta:Columns:Add(DataColumn{"B",typeof(String)})
            Var aColumns := (From d As DataColumn In ta:Columns Where d:ColumnName:StartsWith("A") Orderby d:ColumnName Descending Select d):ToList() // As List<DataColumn>
            Foreach Var col In aColumns
                 ? col:ColumnName
            Next
 
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


	END CLASS
END NAMESPACE // XSharpAllgemein