// ============================================================================
// file: NumericExamples.prg
// ============================================================================

Using System

Begin Namespace XKompendium

	/// <summary>
    /// The definition of the NumericExamples class
    /// </summary>
	Class NumericExamples

        /// <summary>
        /// Use transform()
        /// </summary>
        Public Static Method Precision01() As Void
            Local f1 := 52.325 As Float
            Local Value := Transform(f1, "9,999,999.99") As String
            ? Value
            Value := Transform(f1, "999.999")
            ? Value

        /// <summary>
        /// Use round() with bankers rounding (?)
        /// </summary>
        Public Static Method Precision02() As Void
            Local f1 := 52.325 As Float
            ? Math.Round(f1, 2)
            ? Math.Floor(f1)
            ? Math.Ceiling(f1)

        /// <summary>
        /// Use round() with "normal" rounding (?)
        /// </summary>
        Public Static Method Precision03() As Void
            Local f1 := 52.325M As Decimal
            ? Math.Round(f1, 2)
            ? Math.Round(f1, 2, MidpointRounding.AwayFromZero)
            ? Round(f1,2)


    End Class

End Namespace
