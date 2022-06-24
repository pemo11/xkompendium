// ============================================================================
// file: DictionaryExamples.prg
// ============================================================================

Using System
Using System.Collections.Generic

Begin Namespace XKompendium


	/// <summary>
    /// The definition of the DictionaryExamples class
    /// </summary>
	Public Class DictionaryExamples

        Constructor()
            Return

        /// <summary>
        /// Example for using a Dictionary<T,S>
        /// </summary>
        Public Static Method DictionaryExample1() As Void
            Local dicCities := Dictionary<String, CityInfo>{} As Dictionary<String, CityInfo>
            dicCities:Add("ES", CityInfo{"Esslingen", 89000})
            dicCities:Add("PO", CityInfo{"Plochingen", 34000})
            dicCities:Add("GP", CityInfo{"Göppingen", 45000})
            Foreach k As String In dicCities:Keys
                ? dicCities[k]:ToString()
            Next

        /// <summary>
        /// Example for using a Dictionary<T,S> with simple adding of key,value pairs
        /// </summary>
        Public Static Method DictionaryExample2() As Void
            Local dicCities := Dictionary<String, CityInfo>{} As Dictionary<String, CityInfo>
            dicCities["ES"] := CityInfo{"Esslingen", 89000}
            dicCities["PO"] := CityInfo{"Plochingen", 34000}
            dicCities["GP"] := CityInfo{"Göppingen", 45000}
            Foreach k As String In dicCities:Keys
                ? dicCities[k]:ToString()
            Next

        /// <summary>
        /// Example for using a Dictionary<T,S> with initialization
        /// </summary>
        Public Static Method DictionaryExample3() As Void
            Local dicCities := Dictionary<String, CityInfo>{}  {;
             {"ES", CityInfo{"Esslingen", 89000}},;
             {"PO", CityInfo{"Plochingen", 34000}},;
             {"GP", CityInfo{"Göppingen", 45000}};
             } As Dictionary<String, CityInfo>
            Foreach k As String In dicCities:Keys
                ? dicCities[k]:ToString()
            Next

    End Class

End Namespace

