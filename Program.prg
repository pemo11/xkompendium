// file: Program.prg

Using System
Using System.Collections.Generic
Using System.Linq
Using System.Text

Begin Namespace XKompendium
   
    [STAThread];
    Function Start() As Void Strict
        Console.ForegroundColor := ConsoleColor.Green
        ArrayExamples1.ArrayScan0()
        Console.WriteLine("Fertig...")
        Console.ReadKey()

End Namespace