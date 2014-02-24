import System.Environment (getArgs)
import Data.List.Split (splitOn)

-- there is for sure smthng smarter but ...
isInteger s = case reads s :: [(Integer, String)] of
  [(_, "")] -> True
  _         -> False

join [] str c = str
join _ str c = c ++ str

compute [] lhs [] = lhs
compute [] [] rhs = rhs
compute [] lhs rhs = rhs ++ "|" ++  lhs

compute (x:tl) lhs rhs 
        | isInteger x = compute tl (lhs ++ (join lhs x ",")) rhs
        | otherwise = compute tl lhs (rhs ++ (join rhs x ",")) 

split line = compute (splitOn "," line) [] []

main = do
        [inpFile] <- getArgs
        input <- readFile inpFile
        mapM_ putStrLn $ map split $ lines input
