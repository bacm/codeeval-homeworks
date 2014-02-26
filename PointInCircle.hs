import System.Environment (getArgs)
import Text.Regex.Posix

f :: String -> Double
f s = read (s)
matched l = l =~ "[0-9.-]+" :: [[String]]

transform :: Double -> Double -> Double -> Double -> Double -> Bool 
transform cx cy radius x y = ((x) - (cx))^2 + ((y) - (cy))^2 < (radius)^2

isinside :: [[String]] -> String 
isinside ([cx]:[cy]:[radius]:[x]:[y]:[]) 
        | transform (f cx) (f cy) (f radius) (f x) (f y) = "true"
        | otherwise = "false"

check :: String -> String 
check line = isinside $ matched line

main = do
        [inpFile] <- getArgs
        input <- readFile inpFile
        mapM_ putStrLn $ map check $ lines input
