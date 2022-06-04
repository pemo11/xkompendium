// File: DataTableBeispiele.prg

USING System
USING System.Collections.Generic
Using System.Linq
Using System.Data
USING System.Text

Begin Namespace XSharpAllgemein

	/// <summary>
    /// The DataReaderBeispiele class.
    /// </summary>
	CLASS DataTableBeispiele
    
        Public Static Method TableSelectBeispiel1() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(int)})
            ta:Columns:Add(DataColumn{"Bez", typeof(string)})
            for local i := 1 UpTo(10)
                Local r := ta:NewRow() As DataRow
                r["id"] := i
                r["Bez"] := i"SK: {i}"
                ta:Rows:Add(r)
            next
            Local taFilter := "Bez='SK: 5'" As String
            Local rows := ta:Select(taFilter) As DataRow[]
            foreach r As DataRow in rows
                ? r[0]
            next
            taFilter := "Bez like 'SK*'"
            rows := ta:Select(taFilter)
            foreach r As DataRow in rows
                ? r[1]
            next
            Return
        
        End Method

        Public Static Method TableSelectBeispiel2() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(int)})
            ta:Columns:Add(DataColumn{"Bez", typeof(string)})
            for local i := 1 UpTo(10)
                Local r := ta:NewRow() As DataRow
                r["id"] := i
                r["Bez"] := i"SK: {i}"
                ta:Rows:Add(r)
            next
            Local taFilter := "Bez='SK: 5'" As String
            Local row := DataTableFilter(ta, taFilter) As DataRow
            if row != Null
                row["Bez"] := "!!!"
            end if
            foreach r As DataRow in ta:Rows
                ? r[1]
            next
            Return
        
        End Method

        Public Static Method DataTableFilter(Ta As DataTable, Filter As String) As DataRow
            Local rows := ta:Select(Filter) As DataRow[]
            Return IIf(rows:length > 0,rows[1],null)
            
        Public Static Method SkipColumn() As Void
            Local ta := DataTable{"tab1"} As DataTable
            ta:Columns:Add(DataColumn{"Spalte1", typeof(string)})
            ta:Columns:Add(DataColumn{"Spalte2", typeof(string)})
            ta:Columns:Add(DataColumn{"Spalte3", typeof(string)})
            // Cast<DataColumn> erforderlich, damit Skip() angewendet werden kann
            foreach col As DataColumn in ta:Columns:Cast<DataColumn>():Skip(1)
                ? col:ColumnName
            next

	END CLASS
END NAMESPACE // XSharpAllgemein