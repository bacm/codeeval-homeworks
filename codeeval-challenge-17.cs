using System.Linq;
using Math = System.Math;

internal class Program
{
    private static void Main()
    {
        var l = "2,3,-2,-1,10";
        var input = l.Split(',');
        var list = input.Select(int.Parse).ToArray();

        var steps = list.Length;
        var max = 0;

        while (true)
        {
            if (steps == 0)
                break;

            for (int i = 0; i + steps < list.Length; i++)
                max = Math.Max(max, Sum(list, i, i + steps));

            steps--;
        }
    }

    private static int Sum(int[] list, int start, int end)
    {
        var sum = 0;
        for (int i = start; i < end; i++)
            sum += list[i];
        return sum;
    }
}
