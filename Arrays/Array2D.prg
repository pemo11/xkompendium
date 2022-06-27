// ============================================================================
// File: Array2D.prg
// ============================================================================

Using System

Begin Namespace XKompendium

    /// <summary>
    /// Examples for handling 2D-VO-Arrays
    /// </summary>
	Static Class Array2DExamples1

        /// <summary>
        /// Example for using a 2D Array
        /// </summary>
        Static Method Array2DExample1() As Void
            Local aTemp := {} As Array
            AAdd(aTemp, {"Norwegen", "Oslo"})
            AAdd(aTemp, {"Schweden", "Stockholm"})
            AAdd(aTemp, {"Finnland", "Helsinki"})
            AAdd(aTemp, {"Dänemark", "Kopenhagen"})
            ? i"Die Hauptstadt von {aTemp[1,1]} ist {aTemp[1,2]}"
            ? i"Die Hauptstadt von {aTemp[1][1]} ist {aTemp[1][2]}"
            Return
            
    End Class

End Namespace