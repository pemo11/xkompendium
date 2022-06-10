// file: NumericExamples.prg

Using System

Begin Namespace XKompendium

	/// <summary>
    /// The NumericExamples class
    /// </summary>
	Class NumericExamples

        Public Static Method Precision01() As Void
            Local f1 := 52.325 As Float
            Local wert := Transform(f1, "9,999,999.99") As String
            ? wert
            wert := Transform(f1, "999.999")
            ? wert

        Public Static Method Precision02() As Void
            Local f1 := 52.325 As Float
            ? Math.Round(f1, 2)
            ? Math.Floor(f1)
            ? Math.Ceiling(f1)

        Public Static Method Precision03() As Void
            Local f1 := 52.325M As Decimal
            ? Math.Round(f1, 2)
            ? Math.Round(f1, 2, MidpointRounding.AwayFromZero)
            ? Round(f1,2)


    End Class

End Namespace
