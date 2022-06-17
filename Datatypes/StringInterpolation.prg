// ============================================================================
// file: StringInterpolation.prg
// ============================================================================

Using System
Using System.IO

Begin Namespace XKompendium

	/// <summary>
    /// The definition of the StringInterpolation class
    /// </summary>
	Public Static Class StringInterpolation

        /// <summary>
        /// Does not work because of ToString() with 2.6, but with >= 2.8
        /// Important is "" instead of '
        /// <summary>
        Public Static Method DateOutput1() As Void
            ? i"Today is {DateTime.Now:ToString(""dddd"")}"
            Return

        /// <summary>
        /// Does not work because of ToString() with 2.6, but with >= 2.8
        /// Important is "" instead of '
        /// <summary>
        Public Static Method Datumsausgabe2() As Void
            Local TodayDate := DateTime.Now As DateTime
            ? i"Today is {TodayDate:ToString(""dddd"")}"
            Return

        /// <summary>
        /// Does work with 2.6
        /// <summary>
        Public Static Method Datumsausgabe3() As Void
            Local TodayDate := DateTime.Now:ToString("dddd") As String
            ? i"Today ist {TodayDate}"
            Return

        /// <summary>
        /// Does not work with 2.6 but with >= 2.8
        /// <summary>
        Public Static Method Zufallszahl1() As Void
            ? i"Your lucky number is {Random{}:next(1,10)}"

        /// <summary>
        /// Ok
        /// <summary>
        Public Static Method Zufallszahl2() As Void
            Local z := Random{}:next(1,10) As Int
            ? i"Your lucky number is {z}"

        /// <summary>
        /// Does not work with 2.6 but with >= 2.8
        /// <summary>
        Public Static Method Zufallszahl3() As Void
            Local r := Random{} As Random
            ? i"Your lucky number is {r:next(1,10)}"
            Return

        /// <summary>
        /// Put the exeception message in a string
        /// <summary>
        Public Static Method Exception1() As Void
            Try
                // Throw without an argument is only allowed in the catch part
                Throw SystemException{"Total Chaos"}
            Catch ex As SystemException
                ? i"Unfortunately an error happend: {ex:Message}"
                // just the object always means ToString() which is overloaded and outputs the message too
                ? i"Unfortunately an error happend: {ex}"
            End Try
            Return

        /// <summary>
        /// String manipulation inside String interpolation
        /// <summary>
        Public Static Method Path1() As Void
            Local pfad1 := "C:\Sub1\Sub2\Test.xyz" As String
            Local pfad2 := i"{Path.Combine(Path.GetDirectoryName(pfad1), Path.ChangeExtension(pfad1, ""abc""))}" As String
            ? pfad2
            Return
            
        /// <summary>
        /// Number formating with ToString()
        /// <summary>
        Public Static Method NumberFormat() As Void
            For Local i:= 0 Upto 10
                // ? i"Run Count Nr. {i:000}"
                ? i"Run Count Nr. {i:ToString('000')}"
            Next

    End Class

End Namespace
