// File: ExtensionMethod1.prg
// Ein Beispiel für eine Extension Method, das auch funktioniert!
// Ich habe es auf "Verdacht" ausprobiert, da in der Hilfe lediglich in der Liste der Neuerungungen
// indirekt angedeutet wird, dass es Extension Methods gibt, und dass es für ein Attribut geben soll
// es gibt aber offenbar kein Beispiel

Using System

Begin Namespace XKompendium

	Class ExtensionMethods1

        [Extension(String)];
        Public Static Method Capitalize(str As String) As String
            Local newString := Iif(str:Length > 3, str:substring(0,1):ToUpper() + str:substring(1):ToLower(),str) As String
            Return newString

        Public Static Method Beispiel1() As Void
            Local satz := "heiße sommernächte in der südsee" As String
            Local satzNeu := "" As String
            Foreach Wort As String In satz:Split(c" ")
                satzNeu += Wort:Capitalize() + " "
            Next
            ? satzNeu

    End Class

End Namespace
