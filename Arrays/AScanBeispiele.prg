// File: AScanBeispiele.prg

Using System

Begin Namespace XSharpAllgemein

	Public Static Class AScanBeispiele

        Public Static Method AScan1() As Void
            Local aSachgebiete := {"SG01","SG02  ", "SG03"} As Array
            // SG02 wird trotz Leerzeichen am Ende gefunden
            Local strSG := "SG02" As String
            Local Pos := (Int) AScan(aSachgebiete, {|aVal|aVal=strSG}) As Int
            ? Pos
            Return


        // Prüfen, ob ein Name enthalten ist
        Public Static Method AScan2() As Void
            Local aSachgebiete := {"SG01","SG02  ", "SG03"} As Array
            // SG02 wird trotz Leerzeichen am Ende gefunden
            Local strSG := "SG0X" As String
            Local Pos := (Int) AScan(aSachgebiete, {|aVal|aVal=strSG}) As Int
            If Pos == 0
                ? "*** Sachgebiet wurde nicht gefunden ***"
            Endif
            Return
    End Class

End Namespace
