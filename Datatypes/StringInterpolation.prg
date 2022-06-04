// File: StringInterpolation.prg

Using System
Using System.IO

Begin Namespace XSharpAllgemein

	/// <summary>
    /// The Schleifen class.
    /// </summary>
	Public Static Class StringInterpolation

        // Geht nicht wegen ToString() bei 2.6, geht bei 2.8
        // Wichtig ist aber "" anstatt '
        Public Static Method Datumsausgabe1() As Void
            ? i"Heute ist {DateTime.Now:ToString(""dddd"")}"
            Return

        // Geht nicht wegen ToString() bei 2.6, geht bei 2.8
        // Wichtig ist aber "" anstatt '
        Public Static Method Datumsausgabe2() As Void
            Local Heute := DateTime.Now As DateTime
            ? i"Heute ist {Heute:ToString(""dddd"")}"
            Return

        // Geht dann endlich auch bei 2.6
        Public Static Method Datumsausgabe3() As Void
            Local Heute := DateTime.Now:ToString("dddd") As String
            ? i"Heute ist {Heute}"
            Return

        // Geht nicht bei 2.6, geht bei 2.8
        Public Static Method Zufallszahl1() As Void
            ? i"Deine Glückszahl ist {Random{}:next(1,10)}"

        // Geht
        Public Static Method Zufallszahl2() As Void
            Local z := Random{}:next(1,10) As Int
            ? i"Deine Glückszahl ist {z}"

        // Geht nicht bei 2.6, geht bei 2.8
        Public Static Method Zufallszahl3() As Void
            Local r := Random{} As Random
            ? i"Deine Glückszahl ist {r:next(1,10)}"
            Return

        Public Static Method Exception1() As Void
            Try
                // Throw ohne Argument ist nur im Catch-Zweig erlaubt
                Throw SystemException{"Totales Chaos"}
            Catch ex As SystemException
                ? i"Es trat leider ein Fehler auf: {ex:Message}"
            End Try
            Return

        Public Static Method Path1() As Void
            Local pfad1 := "C:\Sub1\Sub2\Test.xyz" As String
            Local pfad2 := i"{Path.Combine(Path.GetDirectoryName(pfad1), Path.ChangeExtension(pfad1, ""abc""))}" As String
            ? pfad2
            Return
            
        Public Static Method NumberFormat() As Void
            For Local i:= 0 Upto 10
                // ? i"Durchlauf Nr. {i:000}"
                ? i"Durchlauf Nr. {i:ToString('000')}"
            Next

    End Class

End Namespace
