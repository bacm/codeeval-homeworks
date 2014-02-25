import System.Environment (getArgs)
import Data.List.Split (splitOn)
import Numeric (showIntAtBase)
import Data.Char (intToDigit)

compute x pieces 
        | x == 0 = show $ pieces
        | x - 5 >= 0 = compute (x - 5) (pieces + 1)
        | x - 3 >= 0 = compute (x - 3) (pieces + 1)
        | x - 1 >= 0 = compute (x - 1) (pieces + 1)

get input = compute (read input :: Int) 0

main = do
        [inpFile] <- getArgs
        input <- readFile inpFile
        mapM_ putStrLn $ map get $ lines input
