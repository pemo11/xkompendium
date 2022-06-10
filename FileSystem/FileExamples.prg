// File: FileExamples.prg

Using System
Using System.IO
Using System.Threading

Begin Namespace XKompendium

	/// <summary>
    /// The FileExamples class
    /// </summary>
	Class FileExamples

        Private Static Method GenerateText() As String
            Local tmpText := "" As String
            tmpText += "Lorem Ipsum dolores" + CRLF
            tmpText += "Allea ajacta est" + CRLF
            tmpText += "quid bono"
            Return tmpText

        Public Static Method ReadText1(Pfad As String) As String
            Begin Using Var sr := File.OpenText(Pfad)
                Return sr:ReadToEnd()
            End Using

        Public Static Method WriteText1() As Void
            Local tmpPfad := Path.GetTempFileName() As String
            Begin Using Var fs := File.OpenWrite(tmpPfad)
                Begin Using Var sw := StreamWriter{fs}
                    sw:Write(GenerateText())
                End Using
            End Using
            ? i"{tmpPfad} wurde geschrieben mit {FileInfo{tmpPfad}:Length} Bytes"
            ? ReadText1(tmpPfad)

        Private Static _readWriteLock := ReaderWriterLockSlim{} As ReaderWriterLockSlim

        Public Static Method WriteText2() As Void
            _readWriteLock:EnterWriteLock()
            Local tmpPfad := Path.GetTempFileName() As String
            Try
                Begin Using Var sw := StreamWriter{tmpPfad}
                        sw:Write(GenerateText())
                End Using
                ? i"{tmpPfad} wurde geschrieben mit {FileInfo{tmpPfad}:Length} Bytes"
                ? ReadText1(tmpPfad)
            Catch Ex As SystemException
                ? i"Fehler: {ex:Message}"
            Finally
                _readWriteLock:ExitWriteLock()
            End Try

    End Class

End Namespace
