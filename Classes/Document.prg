// File: Document.prg

Begin Namespace XKompendium

    /// <summary>
    /// Definition of the Document class
    /// </summary>
	Class Document
        Private _Id As Int
        Private _Title As String
        Private _Author As Author

        Property Title As String
            Get
                Return Self:_Title
            End Get
            Set
                Self:_Title := Value
            End Set
        End Property

        Property Id As Int
            Get
                Return Self:_Id
            End Get
            Set
                Self:_Id := Value
            End Set
        End Property

        Property Author As Author
            Get
                Return Self:_Author
            End Get
            Set
                Self:_Author := Value
            End Set
        End Property

        Constructor(Id As Int, Title As String) As Void
            Self:_Id := Id
            Self:_Title := Title
            Return

    End Class

End Namespace