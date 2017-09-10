using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using System.Collections.Generic;
using System.IO;
using static System.Console;

namespace Errors
{
    public class Program
    {
        public static void Main(string[] args)
        {
            string fileName = "Errors.cs.txt";
            string code = File.ReadAllText(fileName);
            SyntaxTree parseTree = CSharpSyntaxTree.ParseText(code, path: fileName);

            SyntaxNode root = parseTree.GetRoot();
            IEnumerable<Diagnostic> diagnostics = parseTree.GetDiagnostics(root);
            foreach (var diagnostic in diagnostics)
            {
                WriteLine(diagnostic.ToString());
            }

            ReadLine();
        }
    }
}
