// File: Events.prg
Using System
Using System.Timers

Begin Namespace XKompendium

	Static Class EventExamples

        Static Method StartEvent1() As Void
            // Timer-Event starten
            Local tmr := Timer{} As Timer
            tmr:Interval := 3000
            tmr:Elapsed += {sender, eventArgs =>
                ? "Das Event wurde ausgelöst..."
                ?
                // Events wieder beenden
                tmr:Stop()
            }
            tmr:Start()
            ? "Gleich passiert etwas..."
            ?
            Return

    End Class

End Namespace
