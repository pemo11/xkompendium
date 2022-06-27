// ============================================================================
// file: Program.prg
// ============================================================================
Using System
Using System.Collections.Generic
Using System.Linq
Using System.Text

Begin Namespace XKompendium

    [STAThread];
    Function Start() As Void Strict
        Console.ForegroundColor := ConsoleColor.Green
        // NullExamples.NullCompare4()
        // ArrayExamples1.NetArray()
        // TypeExamples1.TypeExample4()
        Array2DExamples1.Array2DExample1()
        Console.WriteLine()
        Console.WriteLine("Fertig...")
        Console.ReadKey()

End Namespace