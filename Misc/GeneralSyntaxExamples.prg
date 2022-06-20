// ============================================================================
// file: GeneralSyntaxExamples.prg
// ============================================================================

Using System

Begin Namespace XKompendium

	Static Class GeneralSyntax

        /// <summary>
        /// Operation and comparison in one expression
        /// </summary>
        Static Method IfVarExample() As Void
            Local v1 := 1 As Int
            Local v2 := 0 As Int
            
            If (v2 := v1 * 10) == 10
                ? "Stimmt..."
            Else
                ? "Stimmt nicht..."
            Endif
            
            Return
        
        /// <summary>
        /// IIf as an alternative to a ternary operator
        /// </summary>
        Static Method TernaryOp() As Void
            Local v1 As Int
            Local w1 := "Sunday" As String
            v1 := iif(w1 == "Sunday", 1, -1)
            ? v1
            Return
            
    End Class

End Namespace
