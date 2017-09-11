using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using static System.Console;

namespace RoslynDirectives
{
    public class Program
    {
        public static void Main(string[] args)
        {
            string fileName = "Directives.cs.txt";
            string code = File.ReadAllText(fileName);

            SyntaxToken trueNode, newNode, semiNode;
            IEnumerable<SyntaxToken> descendants;

            var options = new CSharpParseOptions().WithPreprocessorSymbols("NETCORE");
            descendants = GetTokens(fileName, code, options);
            trueNode = descendants.First(token => token.ValueText == "true");
            semiNode = descendants.First(token => token.ValueText == ";");

            ForegroundColor = ConsoleColor.White;
            WriteLine("NETCORE enabled");
            PrintTokens(trueNode, semiNode);

            options = new CSharpParseOptions();
            descendants = GetTokens(fileName, code, options);
            newNode = descendants.First(token => token.ValueText == "new");
            semiNode = descendants.First(token => token.ValueText == ";");

            WriteLine("NETCORE disabled");
            PrintTokens(newNode, semiNode);

            ReadLine();
        }

        private static IEnumerable<SyntaxToken> GetTokens(string fileName, string code, CSharpParseOptions options)
        {
            SyntaxTree parseTree = CSharpSyntaxTree.ParseText(code, options, fileName);
            SyntaxNode root = parseTree.GetRoot();
            IEnumerable<SyntaxToken> descendants = root.DescendantTokens(token => true);
            return descendants;
        }

        private static void PrintTokens(SyntaxToken first, SyntaxToken second)
        {
            WriteLine($"`{first.ValueText}` leading:");
            ForegroundColor = ConsoleColor.Green;
            WriteLine(first.LeadingTrivia.ToString());
            ForegroundColor = ConsoleColor.White;
            WriteLine($"`{second.ValueText}` leading:");
            ForegroundColor = ConsoleColor.Green;
            WriteLine(second.LeadingTrivia.ToString());
            ForegroundColor = ConsoleColor.White;
            WriteLine("----------------");
            WriteLine();
        }
    }
}
