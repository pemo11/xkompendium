// ============================================================================
// File: AScanExamples.prg
// ============================================================================

Using System

Begin Namespace XKompendium

    /// <summary>
    /// Examples for using AScan
    /// </summary>
	Public Static Class AScanExamples

        /// <summary>
        /// Scanning an Array with AScan - get the position
        /// </summary>
        Public Static Method AScan1() As Void
            Local aSachgebiete := {"SG01","SG02  ", "SG03"} As Array
            // SG02 will be found despite the blank at the end
            Local strSG := "SG02" As String
            Local Pos := (Int) AScan(aSachgebiete, {|aVal|aVal=strSG}) As Int
            ? Pos
            Return


        /// <summary>
        /// Scanning an Array with AScan - check for a name
        /// </summary>
        Public Static Method AScan2() As Void
            Local aSachgebiete := {"SG01","SG02  ", "SG03"} As Array
            // SG02 will be found despite the blank at the end
            Local strSG := "SG0X" As String
            Local Pos := (Int) AScan(aSachgebiete, {|aVal|aVal=strSG}) As Int
            If Pos == 0
                ? "*** No luck at all, nothing was found ***"
            Endif
            Return

    End Class

End Namespace
