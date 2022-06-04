// File: AllgemeineSyntax.prg

Using System

Begin Namespace XSharpAllgemein

	Static Class AllgemeineSyntax

        Static Method IfVarBeispiel() As Void
            Local v1 := 1 As Int
            Local v2 := 0 As Int
            
            if (v2 := v1 * 10) == 10
                ? "Stimmt..."
            else
                ? "Stimmt nicht..."
            endif
            
            Return
        
        Static Method TernaryOp() As Void
            Local v1 As Int
            Local w1 := "Sonntag" As String
            v1 := iif(w1 == "Sonntag", 1, -1)
            ? v1
            Return
            
    End Class

End Namespace
