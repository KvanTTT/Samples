using static System.Console;

namespace Ambiguities
{
    public class Program
    {
        class Foo
        {
            public string Bar { get; set; }
        }

        public static void Main(string[] args)
        {
            var foo = new Foo();
            WriteLine(nameof(foo.Bar));
            ReadLine();
        }

        static string nameof(string str) => "42"; // Try to comment this line.
    }
}
