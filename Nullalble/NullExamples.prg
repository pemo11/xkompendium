// File: NullExamples.prg

Using System
Using System.Collections.Generic

Begin Namespace XKompendium

	Public Static Class NullExamples
 
        Static Method DatumsAbfrage() As Void
            Local d As DateTime?
            d := Null
            ? "Hat Wert: " + d:HasValue:ToString()
            Return 
            
    End Class
    
End Namespace
