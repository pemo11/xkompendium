// Loops.prg

Using System

Begin Namespace XKompendium

	/// <summary>
    /// The Schleifen class.
    /// </summary>
	Public Class Loops

        Static Method For1() As  Void
            For Local i := 0 Upto 10
                ? i
            Next
            Return

        Static Method For2() As  Void
            For Local i := 0 Upto 10 Step 3
                ? i
            Next
            Return

        Static Method LoopBreak() As  Void
            Local Abbruch := False As Boolean
            For Local i := 1 Upto 3
                For Local j := 1 Upto 3
                    ? i"*** Durchlauf mit i={i} und j={j} ***"
                    If j == 2
                        Abbruch := True
                        Exit
                    Endif
                Next
                If Abbruch
                    Exit
                Endif
            Next
            Return

    End Class

End Namespace