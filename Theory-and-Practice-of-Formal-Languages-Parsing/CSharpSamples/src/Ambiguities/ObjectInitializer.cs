namespace ObjectInitializer
{
    public class Foo
    {
        public string Bar { get; set; }
    }

    public class A
    {
        public string Bar { get; set; }

        public void B()
        {
            var foo = new Foo
            {
                Bar = Bar
            };
        }
    }
}
