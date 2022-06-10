// File: Ort.prg

Using System
Using System.Collections.Generic
Using System.Text

Begin Namespace XKompendium

	/// <summary>
    /// The Ort class
    /// </summary>
	Public Class Ort
        Private _Name As String
        Private _Einwohner As Int
        
        Constructor(Name As String, Einwohner As Int)
            Self:_Name := Name
            Self:_Einwohner := Einwohner
            
        Public Property Name As String
            Get 
                Return Self:_Name
            End Get
        End Property
        
        Public Property Einwohner As Int
            Get 
                Return Self:_Einwohner
            End Get
        End Property

        End Class

End Namespace
