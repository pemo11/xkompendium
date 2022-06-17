// ============================================================================
// file: FileExamples.prg
// ============================================================================

Using System
Using System.IO
Using System.Threading

Begin Namespace XKompendium

	/// <summary>
    /// The definition of the FileExamples class
    /// </summary>
	Class FileExamples

        /// <summary>
        /// Generate dummy text
        /// </summary>
        /// <returns></returns>
        Private Static Method GenerateText() As String
            Local tmpText := "" As String
            tmpText += "Lorem Ipsum dolores" + CRLF
            tmpText += "Allea ajacta est" + CRLF
            tmpText += "quid bono"
            Return tmpText

        /// <summary>
        /// Read text from a file
        /// </summary>
        /// <param name="Pfad"></param>
        /// <returns></returns>
        Public Static Method ReadText1(Pfad As String) As String
            Begin Using Var sr := File.OpenText(Pfad)
                Return sr:ReadToEnd()
            End Using

        /// <summary>
        /// Write text to a file
        /// </summary>
        Public Static Method WriteText1() As Void
            Local tmpPfad := Path.GetTempFileName() As String
            Begin Using Var fs := File.OpenWrite(tmpPfad)
                Begin Using Var sw := StreamWriter{fs}
                    sw:Write(GenerateText())
                End Using
            End Using
            ? i"{tmpPfad} was written with {FileInfo{tmpPfad}:Length} Bytes"
            ? ReadText1(tmpPfad)

        Private Static _readWriteLock := ReaderWriterLockSlim{} As ReaderWriterLockSlim

        /// <summary>
        /// Write text with a write lock
        /// </summary>
        Public Static Method WriteText2() As Void
            _readWriteLock:EnterWriteLock()
            Local tmpPfad := Path.GetTempFileName() As String
            Try
                Begin Using Var sw := StreamWriter{tmpPfad}
                        sw:Write(GenerateText())
                End Using
                ? i"{tmpPfad} was written with {FileInfo{tmpPfad}:Length} Bytes"
                ? ReadText1(tmpPfad)
            Catch Ex As SystemException
                ? i"Error: {ex:Message}"
            Finally
                _readWriteLock:ExitWriteLock()
            End Try

    End Class

End Namespace
