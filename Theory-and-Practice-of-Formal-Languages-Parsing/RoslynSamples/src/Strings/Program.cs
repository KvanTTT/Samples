using System;
using static System.Console;

namespace Strings
{
    class Person
    {
        public string Name { get; set; } = "";

        public int Age { get; set; } = 0;

        public Person()
        {
        }

        public Person(string name, int age)
        {
            Name = name;
            Age = age;
        }

        public override string ToString() => $"{Name}: {Age}";
    }

    class Program
    {
        static void Main(string[] args)
        {
            var p = new Person("Platon", 128);
            double g = 0.5, b = Math.PI;

            WriteLine($"{p.Name} is \"{p.Age} year{(p.Age == 1 ? "" : "s")} old");
            WriteLine($"{(p.Age == 2 ? $"{new Person { } }" : "")}");
            WriteLine($@"\{p.Name}
                       ""\");
            WriteLine($"Color[R={func(b: 3):#0.##}, G={g:#0.##}, B={b:#0.##}]");

            ReadLine();
        }

        static double func(int a = int.MaxValue, int b = 0)
        {
            return a / 2 + b / 2 + (a & b & 1);
        }
    }
}