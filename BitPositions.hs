import System.Environment (getArgs)
import Data.List.Split (splitOn)
import Numeric (showIntAtBase)
import Data.Char (intToDigit)

p n = showIntAtBase 2 intToDigit n ""

bin n p1 p2 
        | n!!(p1-1) == n!!(p2-1) = "true"
        | otherwise = "false"

getpnth n nth = read (n!!nth) :: Int

reversebits n = reverse (p (getpnth n 0))

match n = bin (reversebits n) (getpnth n 1) (getpnth n 2)

split input = match $ splitOn "," input

main = do
        [inpFile] <- getArgs
        input <- readFile inpFile
        mapM_ putStrLn $ map split $ lines input
