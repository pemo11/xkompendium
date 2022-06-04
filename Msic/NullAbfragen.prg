// File: NullAbfragen.prg

Using System
Using System.Collections.Generic

Begin Namespace XSharpAllgemein

	Public Static Class NullBeispiele
 
        Static Method DatumsAbfrage() As Void
            Local d As DateTime?
            d := Null
            ? "Hat Wert: " + d:HasValue:ToString()
            Return 
            
    End Class
    
End Namespace
