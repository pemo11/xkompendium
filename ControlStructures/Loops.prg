// ============================================================================
// file: Loops.prg
// ============================================================================

Using System

Begin Namespace XKompendium

	/// <summary>
    /// the definition of the Loops class
    /// </summary>
	Public Class Loops

        /// <summary>
        /// Classic for loop with index variable
        /// </summary>
        Static Method ForExample1() As  Void
            For Local i := 0 Upto 10
                ? i
            Next
            Return

        /// <summary>
        /// Classic for loop with index variable and step
        /// </summary>
        Static Method ForExample2() As  Void
            For Local i := 0 Upto 10 Step 3
                ? i
            Next
            Return

        /// <summary>
        /// Classic for loop with break through exit
        /// </summary>
        Static Method LoopBreakExample() As  Void
            Local CancelFlag := False As Boolean
            For Local i := 1 Upto 3
                For Local j := 1 Upto 3
                    ? i"*** Looping with i={i} and j={j} ***"
                    If j == 2
                        CancelFlag := True
                        Exit
                    Endif
                Next
                If CancelFlag
                    Exit
                Endif
            Next
            Return

    End Class

End Namespace