// ============================================================================
// file: ForEachExamples.prg
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

        /// <summary>
        /// The constructor
        /// </summary>
        Static Constructor()
            Cities2 := List<CityInfo>{}{CityInfo{"Esslingen",80000},;
             CityInfo{"Plochingen",45000}, CityInfo{"Göppingen",42000},;
             CityInfo{"Nürtingen", 32000}}

        /// <summary>
        /// Enumerating a List<T> with foreach and an var
        /// </summary>
        Static Method ForEachExample1() As Void
            Var Cities := List<String>{}{"Esslingen","Plochingen","Göppingen","Nürtingen"}
            Foreach Var City In Cities2
                ? City
            Next
            Return

        /// <summary>
        /// Enumerating a List<T> with foreach and an explicit data type
        /// </summary>
        Static Method ForEachExample2() As Void
            Var Cities := List<String>{}{"Esslingen","Plochingen","Göppingen","Nürtingen"}
            Foreach City As String In Cities
                ? City
            Next
            Return

        /// <summary>
        /// Initializing a List<T> list
        /// </summary>
        Static Method ForEachExample3() As Void
            Var Controls := List<Control>{}{Control{"Button"},Control{"Ribbon"},Control{"Checkbox"}}
            Foreach Var Control In Controls
                ? Control:Name
            Next

        /// <summary>
        /// Enumerating a List<T> with a class variable
        /// </summary>
        Static Method ForEachExample4() As Void
            // this syntax is not allowed
            // ForEach Self:Stadt2 in Self:Staedte2
            Foreach si As CityInfo In Cities2
                City2 := si
                ? City2:Name
            Next
            Return

        /// <summary>
        /// Enumerating a List<T> with a index variable
        /// </summary>
        Static Method ForEachExample5() As Void
            For Local i := 0 Upto Cities2:Count - 1
                City2 := Cities2[i]
                ? City2:Name
            Next
            Return

    End Class

End Namespace
