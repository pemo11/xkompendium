// File: DataTableLinq.prg

Using System
Using System.Collections.Generic
Using System.Linq
Using System.Data
Using System.Text

Begin Namespace XKompendium
    
	/// <summary>
    /// The DataTableLing class
    /// </summary>
	Class DataTableLinq
    
        Public Static Method TableForEachBeispiel1() As Void
            Local ta := DataTable{} As DataTable
            ta:Columns:Add(DataColumn{"Id", typeof(Int)})
            ta:Columns:Add(DataColumn{"State", typeof(Boolean)})
            For Local i := 1 Upto(10)
                Local r := ta:NewRow() As DataRow
                r["id"] := i
                ta:Rows:Add(r)
            Next
            // Alle State-Spalten auf True setzen
            // Cast() ist erforderlich, damit es ein ToList gibt
            // Etwas umständlich, aber es geht;)
            ta:Rows:Cast<DataRow>():ToList():ForEach({r => r["State"] := False})
            
            Foreach r As DataRow In ta:Rows
                ? r["State"]
            Next
            Return
        
        End Method



    End Class
    
End Namespace