// ============================================================================
// file: TimerEvents.prg
// ============================================================================

Using System
Using Sys = System.Timers

Begin Namespace XKompendium

    /// <summary>
    /// Definition of the AnonymousMethods class
    /// </summary>
	Static Class TimerEvents
        Static Private tmr As Sys.Timer
        Static Private Counter := 0 As Int32

        /// <summary>
        /// Simple event handler method
        /// Interesting: e parameter does not have to be of type ElapsedEventArgs
        /// </summary>
        Static Method TimerEvent(Sender As Object, e As EventArgs) As Void
            ? "*** Timer-Event ***"
            Counter++
            If Counter == 5
                tmr:Stop()
                ? "*** Ready ***"
            Endif

        /// <summary>
        /// Binding the ElapsedEventHandler to an event method
        /// </summary>
        Static Method Example1() As Void
            Counter := 0
            tmr := Sys.Timer{}
            tmr:interval := 1000
            tmr:Elapsed += Sys.ElapsedEventHandler{timerEvent}
            tmr:Start()
            ? "*** Start ***"
            Return

        /// <summary>
        /// Binding the ElapsedEventHandler with a Delegate
        /// </summary>
        Static Method Example2() As Void
            Counter := 0
            tmr := Sys.Timer{}
            tmr:interval := 1000
            tmr:Elapsed += Delegate(Sender As Object, e As Sys.ElapsedEventArgs) {
                ? "*** Timer-Event ***"
                Counter++
                If Counter == 5
                    tmr:Stop()
                    ? "*** Ready ***"
                Endif
            }
            tmr:Start()
            ? "*** Start ***"

        Return

        /// <summary>
        /// Binding the ElapsedEventHandler with an inline event handler
        /// </summary>
       Static Method Example3() As Void
            Counter := 0
            tmr := Sys.Timer{}
            tmr:interval := 1000
            tmr:Elapsed += {Sender, e =>
                ? "*** Timer-Event ***"
                Counter++
                If Counter == 5
                    tmr:Stop()
                    ? "*** Ready ***"
                Endif
            }
            tmr:Start()
            ? "*** Start ***"

        Return

    End Class

End Namespace