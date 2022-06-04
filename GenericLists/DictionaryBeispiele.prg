// File: DictionaryBeispiele.prg

USING System
USING System.Collections.Generic

Begin Namespace XSharpAllgemein

      
	/// <summary>
    /// The DictionaryBeispiele class.
    /// </summary>
	Public Class DictionaryBeispiele
    
        Constructor()
            Return
            
        Public Static Method DictionaryBeispiel1() As Void
            Local dicStaedte := Dictionary<String, StadtInfo>{} As Dictionary<String, StadtInfo>
            dicStaedte:Add("ES", StadtInfo{"Esslingen", 89000})
            dicStaedte:Add("PO", StadtInfo{"Plochingen", 34000})
            dicStaedte:Add("GP", StadtInfo{"Göppingen", 45000})
            ForEach k As String in dicStaedte:Keys
                ? dicStaedte[k]:ToString()
            Next

        Public Static Method DictionaryBeispiel2() As Void
            Local dicStaedte := Dictionary<String, StadtInfo>{}  {;
            {"ES", StadtInfo{"Esslingen", 89000}},;
            {"PO", StadtInfo{"Plochingen", 34000}},;
            {"GP", StadtInfo{"Göppingen", 45000}};
            } As Dictionary<String, StadtInfo>
            ForEach k As String in dicStaedte:Keys
                ? dicStaedte[k]:ToString()
            Next

    End Class

End Namespace

