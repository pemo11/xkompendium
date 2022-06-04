// ForEachBeispiele.prg

Using System
Using System.Collections.Generic

Begin Namespace XSharpAllgemein

    Class Control
        Export Name As String
        Constructor(Name As String)
            Self:Name := Name
           
    End Class
    
    Class StadtInfo
        Private _Einwohner As Int
        Private _Stadt As String
        
        Constructor(Name As String, Einwohner As Int)
            Self:_Einwohner := Einwohner
            Self:_Stadt := Name
        
        Property Einwohner As Int
            Get
                Return Self:_Einwohner
            End Get
            Set 
                Self:_Einwohner := Value
            End Set
        End Property
        
        Property Stadt As String
            Get
                Return Self:_Stadt
            End Get
            Set 
                Self:_Stadt := Value
            End Set
        End Property
        
        Method ToString() As String
            Return "Name=" + Self:_Stadt + " Einwohner: " + Self:_Einwohner:ToString("f2")

    End Class
    
	Class ForEachBeispiele
        Private Static Staedte2 As List<StadtInfo>
        Private Static Stadt2 As StadtInfo
        
        Static Constructor()
            Staedte2 := List<StadtInfo>{}{StadtInfo{"Esslingen",80000},;
             StadtInfo{"Plochingen",45000}, StadtInfo{"Göppingen",42000},;
             StadtInfo{"Nürtingen", 32000}}
                
        Static Method Beispiel1() As Void
            var Staedte := List<String>{}{"Esslingen","Plochingen","Göppingen","Nürtingen"}
            ForEach var Stadt in Staedte
                ? Stadt
            Next
            Return 

        Static Method Beispiel2() As Void
            var Staedte := List<String>{}{"Esslingen","Plochingen","Göppingen","Nürtingen"}
            ForEach Stadt As String in Staedte
                ? Stadt
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
            ForEach si As StadtInfo in Staedte2
                Stadt2 := si
                ? Stadt2:Stadt
            Next
            Return 

        Static Method Beispiel5() As Void
            // Durchlauf einer Liste über eine Klassenvariable
            // Diese Schreibweise geht nicht
            // ForEach Self:Stadt2 in Self:Staedte2
            For Local i := 0 UpTo Staedte2:Count - 1
                Stadt2 := Staedte2[i]
                ? Stadt2:Stadt
            Next
            Return 

    End Class
    
End Namespace
