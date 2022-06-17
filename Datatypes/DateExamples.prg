// ============================================================================
// File: DateExamples.prg
// ============================================================================

#define lCore

Using System

Begin Namespace XKompendium

    /// <summary>
    /// The definition of the DateExamples class
    /// </summary>
    Public Static Class DateExamples

        // Diff between two Date values
        // Not available in Core because of the Date type
        #ifndef lCore
        Static Method DateExample1() As Void
            // Local d1 := CTod("25.10.1962") As Date
            Local d1 := CTod("01.12.2018") As Date
            Local d2 := Today() As Date
            Var dateDiff := (d2 - d1)
            ? dateDiff
            Local jahr := (Int)Year(d1) As Int
            jahr := d1:Year
            // geht nicht!
            // ? d1 >= (DWord)2018

            Return
        #endif

        /// <summary>
        /// Querying NullDate()
        /// </summary>
        Public Static Method NullDate1() As Void
            Local d1 := __Date.NullDate() As Date
            ? d1
            Return

    End Class

End Namespace