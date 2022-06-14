// ============================================================================
// ForEachExamples.prg
// ============================================================================

Using System
Using System.Collections.Generic

Begin Namespace XKompendium

    /// <summary>
    /// Definition of the ForEachExamples class
    /// </summary>
	Class ForEachExamples
        Private Static Cities2 As List<CityInfo>
        Private Static City2 As CityInfo

        Static Constructor()
            Cities2 := List<CityInfo>{}{CityInfo{"Esslingen",80000},;
             CityInfo{"Plochingen",45000}, CityInfo{"Göppingen",42000},;
             CityInfo{"Nürtingen", 32000}}

        Static Method Beispiel1() As Void
            Var Cities := List<String>{}{"Esslingen","Plochingen","Göppingen","Nürtingen"}
            Foreach Var City In Cities2
                ? City
            Next
            Return

        Static Method Beispiel2() As Void
            var Cities := List<String>{}{"Esslingen","Plochingen","Göppingen","Nürtingen"}
            Foreach City As String In Cities
                ? City
            Next
            Return

        Static Method Beispiel3() As Void
            var Controls := List<Control>{}{Control{"Button"},Control{"Ribbon"},Control{"Checkbox"}}
            ForEach var Control in Controls
                ? Control:Name
            Next

        Static Method Beispiel4() As Void
            // Durchlauf einer Liste über eine Klassenvariable
            // Diese Schreibweise geht nicht
            // ForEach Self:Stadt2 in Self:Staedte2
            Foreach si As CityInfo In Cities2
                City2 := si
                ? City2:Name
            Next
            Return

        Static Method Beispiel5() As Void
            // Durchlauf einer Liste über eine Klassenvariable
            // Diese Schreibweise geht nicht
            // ForEach Self:Stadt2 in Self:Staedte2
            For Local i := 0 Upto Cities2:Count - 1
                City2 := Cities2[i]
                ? City2:Name
            Next
            Return

    End Class

End Namespace
