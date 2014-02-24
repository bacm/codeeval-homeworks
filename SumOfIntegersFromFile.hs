import System.Environment (getArgs)
import Data.List.Split (splitOn)

g [] sum = (show sum)
g (x:xs) sum = g xs (sum + (read x :: Int))

main = do
        [inpFile] <- getArgs
        input <- readFile inpFile
        putStrLn $ g (lines input) 0
        
