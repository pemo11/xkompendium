// ============================================================================
// File: TypeExamples1.prg
// ============================================================================
Using System

Begin Namespace XKompendium

    /// <summary>
    /// Examples for dealing with Types
    /// </summary>
	Public Static Class TypeExamples1

        /// <summary>
        /// Type name output
        /// </summary>
        Static Method TypeExample1() As Void
            Local c1 := CityInfo{"Rio", 12000000} As CityInfo
            ? c1:GetType():FullName

        /// <summary>
        /// Type name output with a var variable
        /// </summary>
        Static Method TypeExample2() As Void
            Var c1 := CityInfo{"New York", 9000000}
            ? c1:GetType():FullName

        /// <summary>
        /// Type comparision by typeof() function
        /// </summary>
        Static Method TypeExample3() As Void
            Var c1 := CityInfo{"Tokio", 8000000}
            ? typeof(CityInfo) == c1:GetType()

        /// <summary>
        /// Type comparision by is operator
        /// </summary>
        Static Method TypeExample4() As Void
            Var c1 := CityInfo{"Hamburg", 2000000}
            ? c1 Is CityInfo

    End Class

End Namespace
