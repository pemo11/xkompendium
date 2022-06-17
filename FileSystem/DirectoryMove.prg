// ============================================================================
// file: DirectoryMove.prg
// ============================================================================

Using System
Using System.IO
Using System.Linq

Begin Namespace XKompendium

    /// <summary>
    /// Definition of the DirectoryMove class
    /// </summary>
	Class DirectoryMove

        /// <summary>
        /// Move a directory with subdirectories and files by moving each item
        /// </summary>
        /// <param name="sourcePath"></param>
        /// <param name="targetPath"></param>
        Public Static Method MoveDirectory(sourcePath As String, targetPath As String) As Void
            Var files := Directory.EnumerateFiles(sourcePath, "*", SearchOption.AllDirectories).GroupBy({s => Path.GetDirectoryName(s)})
            Foreach Var folder In files
                Var targetFolder := folder:Key:Replace(sourcePath, targetPath)
                Directory.CreateDirectory(targetFolder)
                Foreach Var file In folder
                    Var targetFile := Path.Combine(targetFolder, Path.GetFileName(file))
                    If File.Exists(targetFile)
                        File.Delete(targetFile)
                    End If
                    File.Move(file, targetFile)
                Next
            Next

            Directory.Delete(sourcePath, True)

            Return

    End Class

End Namespace
