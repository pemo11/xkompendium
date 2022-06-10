// File: DateExamples.prg

#define lCore

Using System

Begin Namespace XKompendium

    Public Static Class DateExamples

        // Differenz zweier Date-Werte
        // Kann in Core nicht kompiliert werden wegen Date
        #ifndef lCore
        Static Method Beispiel1() As Void
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

        Public Static Method NullDate1() As Void
            Local d1 := __Date.NullDate() As Date
            ? d1
            Return

    End Class

End Namespace