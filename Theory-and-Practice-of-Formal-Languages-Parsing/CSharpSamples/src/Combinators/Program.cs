using Sprache;
using System.Linq;
using static System.Console;

namespace Combinators
{
    class Program
    {
        static void Main(string[] args)
        {
            Parser<string> identifier =
                from leading in Parse.WhiteSpace.Many()
                from first in Parse.Letter.Once()
                from rest in Parse.LetterOrDigit.Many()
                from trailing in Parse.WhiteSpace.Many()
                select new string(first.Concat(rest).ToArray());

            var id = identifier.Parse(" abc123  ");

            WriteLine(id);
            ReadLine();
        }
    }
}