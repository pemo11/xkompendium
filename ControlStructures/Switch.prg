// ============================================================================
// File: Switch.prg
// ============================================================================

Begin Namespace XKompendium
    
    Class SwitchExamples
        
        Method SwitchExample1() As Void
            Local Note := 3 As Int
            Local Bewertung := "Keine Bewertung" As String
            Switch Note
                Case 1
                    Bewertung := "Superb und überaus formidable"
                Case 2
                    Bewertung := "Ganz ausgezeichnet"
                Case 3
                    Bewertung := "Sehr gut, aber ausbaufähig"
                Case 4
                    Bewertung := "Nicht schlecht, solide Leistung"
                Case 5
                    Bewertung := "Das ist noch Luft nach oben"
                Case 6
                    Bewertung := "Das kannt Du besser"
            End Switch
            ? Bewertung
    End Class
    
End Namespace
