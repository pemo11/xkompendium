// File: DictionaryExamples.prg

Using System
Using System.Collections.Generic

Begin Namespace XKompendium


	/// <summary>
    /// The DictionaryBeispiele class
    /// </summary>
	Public Class DictionaryExamples

        Constructor()
            Return

        Public Static Method DictionaryBeispiel1() As Void
            Local dicCities := Dictionary<String, CityInfo>{} As Dictionary<String, CityInfo>
            dicCities:Add("ES", CityInfo{"Esslingen", 89000})
            dicCities:Add("PO", CityInfo{"Plochingen", 34000})
            dicCities:Add("GP", CityInfo{"Göppingen", 45000})
            Foreach k As String In dicCities:Keys
                ? dicCities[k]:ToString()
            Next

        Public Static Method DictionaryBeispiel2() As Void
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

