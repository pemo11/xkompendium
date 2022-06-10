// File: NetVersion.prg


USING System
USING System.Collections.Generic
USING System.Text
Using Microsoft.Win32
Using System.Text.RegularExpressions

Begin Namespace XKompendium

	Public Static CLASS NetVersion

        Public Static Method GetNetVersion() as List<String>
            Local NetVersionList := List<String>{} As List<String>
            Local Muster := "\.NETFramework,Version=v([\d.]+)$" As String
            Local HklmKey := Registry.LocalMachine As RegistryKey
            Local SkusKey := HklmKey:OpenSubKey("Software\Microsoft\.NETFramework\v4.0.30319\SKUs") As RegistryKey 
            foreach var SkuKeyName in skusKey:GetSubKeyNames()
                Local m := Regex.Match(SkuKeyName, Muster) As Match
                if m:Success
                    NetVersionList:Add(m:Groups[1]:Value)
                endif
            next
            return NetVersionList

    End Class

End Namespace // XSharpAllgemein