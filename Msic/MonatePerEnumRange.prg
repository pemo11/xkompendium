// File: MonatePerEnumRange.prg

Using System
Using System.Data
Using System.IO
Using System.Linq

Begin Namespace XSharpAllgemein

	Public Static Class MonatePerEnumRange
 
        Public Static Method Monate() As String[]
            var Monate := Enumerable.Range(1,12).Select({m => (DateTime{2020,m, 1}).ToString("MMMM")}):ToArray()
            Return Monate
        End Method

    End Class
    
End Namespace