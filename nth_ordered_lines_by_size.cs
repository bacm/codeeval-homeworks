using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

internal class nth_ordered_lines_by_size
{
    private class Alg
    {
        private readonly int _nth;

        private int _shortest = 0;

        private readonly List<Tuple<int, string>> _collection;

        public Alg(int nth)
        {
            _nth = nth;
            _collection = new List<Tuple<int, string>>();
        }

        public void Check(string line)
        {
            var len = line.Length;

            if (_collection.Count != _nth)
            {
                _collection.Add(new Tuple<int, string>(len, line));
                _shortest = _collection.Min(x => x.Item1);
                return;
            }

            if (len < _shortest) return;

            _collection.Remove(_collection.First(x => x.Item1 == _shortest));
            _collection.Add(new Tuple<int, string>(len, line));
            _shortest = _collection.Min(x => x.Item1);
        }

        public IEnumerable<string> Print()
        {
            return _collection.OrderByDescending(x => x.Item1).Select(x => x.Item2).ToArray();
        }
    }

    private static int Main(string[] args)
    {
        using (StreamReader reader = File.OpenText(args[0]))
        {
            int nth;
            int.TryParse(reader.ReadLine(), out nth); // avoid R# warnings about NotNull arg

            var alg = new Alg(nth);

            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                if (string.IsNullOrWhiteSpace(line))
                    continue;

                alg.Check(line);
            }

            foreach (var s in alg.Print())
            {
                Console.WriteLine(s);
            }
        }

        return 0;
    }
}