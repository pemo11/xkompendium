// ============================================================================
// File: TypeExamples2.prg
// ============================================================================
Using System

Begin Namespace XKompendium

    /// <summary>
    /// Examples for dealing with Types
    /// </summary>
	Public Static Class TypeExamples2

        /// <summary>
        /// Comparison of different types
        /// </summary>
        Static Method TypeExample1() As Void
            Var c1 := CityInfo{"Rio", 12000000}
            Var d1 := Document{1, "no fears, just ideas"}
            // Not posible - Compiler error
            // ? c1 Is d1
            ? c1:GetType() == d1:GetType()

        /// <summary>
        /// Comparison of different types with negation
        /// </summary>
        Static Method TypeExample2() As Void
            Var c1 := CityInfo{"Rio", 12000000}
            Var d1 := Document{1, "no fears, just ideas"}
            ? c1:GetType() != d1:GetType()

        /// <summary>
        /// Comparison of identical types
        /// </summary>
        Static Method TypeExample3() As Void
            Var c1 := CityInfo{"Rio", 12000000}
            Var c2 := CityInfo{"Shanghai", 22000000}
            // Not working either
            // ? c1 Is c2
            // Not good because etwas umständlich
            ? c1 Is CityInfo .and. c2 Is CityInfo

    End Class

End Namespace
