// ============================================================================
// file: ScopeExamples.prg
// ============================================================================

Using System

Begin Namespace XKompendium

    Global v2 As Int

	/// <summary>
    /// The definition of the ScopeExamples class
    /// </summary>
	Class ScopeExamples

        /// <summary>
        /// Local variable inside while loop
        /// </summary>
        Method ScopeTest1() As Void
            // Local v1 As Int
            Local n := 1 As Int
            While n < 10
                Local v2 As Int
                v2 += n
            End While
            // Geht nicht, da v2 nicht in diesem Scope definiert ist
            // ? v2

            Return

        /// <summary>
        /// Local variable inside while loop
        /// </summary>
        Method ScopeTest2() As Void
            Local n := 1 As Int
            While n < 10
                // Geht nicht, auch wenn ein neuer Scope entsteht
                // Local v1 As Int
                Local v11 As Int
                v11 += n
            End While
            // v11 is nicht mehr ansprechbar
            // ? v11

            Return

        /// <summary>
        /// Local variable inside while loop
        /// </summary>
        Method ScopeTest3() As Void
            Local n := 1 As Int
            While n < 10
                v2 += n
            End While
            ? v2
            Return


    End Class

End Namespace
