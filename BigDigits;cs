namespace BigDigits
{
    class Program
    {
        static void Main(string[] args)
        {
            const string fonts = @"-**----*--***--***---*---****--**--****--**---**--*--*--**-----*----*-*--*-*----*-------*-*--*-*--*-*--*---*---**---**--****-***--***----*---**---***-*--*---*--*-------*----*----*-*--*--*---*--*----*--**---***-****-***-----*-***---**---*----**---**----------------------------------------------------";

            var input = "01 - 01 - 1970";
            var list = new int?[input.Length];
            var added = 0;

            foreach (char c in input)
            {
                if (!char.IsDigit(c)) continue;
                list[added++] = c - '0';
            }

            for (var zeroIndexLine = 0; zeroIndexLine < 6; zeroIndexLine ++)
            {
                var start = 5*10*zeroIndexLine; // letter size * all digits * the line
                for (var i = 0; i < added; i++)
                {
                    var number = list[i];
                    // ReSharper disable once PossibleInvalidOperationException // we are sure it's not null
                    var numberStart = start + number.Value*5;
                    var str = fonts.Substring(numberStart, 5);
                    System.Console.Write(str);
                }

                System.Console.WriteLine();
            }
        }
    }
}
