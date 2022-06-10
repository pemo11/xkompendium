// File: AnonymousMethods.prg

Using System
Using System.Timers

Begin Namespace XKompendium

	Static Class AnonymousMethods
        Static Private tmr As Timer
        Static Private Counter := 0 As Int32

        Static Method Beispiel1() As Void
            Counter := 0
            tmr := Timer{}
            tmr:interval := 1000
            tmr:Elapsed += ElapsedEventHandler{timerEvent}
            tmr:Start()
            ? "*** Start ***"

        Return

        // Interessant: Parameter e muss nicht vom Typ ElapsedEventArgs sein
        Static Method TimerEvent(Sender As Object, e As EventArgs) As Void
            ? "*** Timer-Event ***"
            Counter++
            If Counter == 5
                tmr:Stop()
                ? "*** Fertig ***"
            Endif

        Static Method Beispiel2() As Void
            Counter := 0
            tmr := Timer{}
            tmr:interval := 1000
            tmr:Elapsed += Delegate(Sender As Object, e As ElapsedEventArgs) {
                ? "*** Timer-Event ***"
                Counter++
                If Counter == 5
                    tmr:Stop()
                    ? "*** Fertig ***"
                Endif
            }
            tmr:Start()
            ? "*** Start ***"

        Return

       Static Method Beispiel3() As Void
            Counter := 0
            tmr := Timer{}
            tmr:interval := 1000
            tmr:Elapsed += {Sender, e =>
                ? "*** Timer-Event ***"
                Counter++
                If Counter == 5
                    tmr:Stop()
                    ? "*** Fertig ***"
                Endif
            }
            tmr:Start()
            ? "*** Start ***"

        Return

    End Class

End Namespace