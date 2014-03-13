import System.Environment (getArgs)
import Data.List.Split (splitOn)
import Data.List (sortBy)
import Data.List (nub)
import Data.List (intercalate)

sort' (a1, b1) (a2, b2)
  | a1 > a2 = GT
  | a1 < a2 = LT
  | a1 == a2 = compare b1 b2

minimum' :: Ord a => [(a, t)] -> [(a, t)]
minimum' []     = []
minimum' (x:xs) = minTail x xs
  where minTail currentMin [] = [currentMin]
        minTail (m, n) (p:ps)
          | m > (fst p) = minTail p ps
          | otherwise   = minTail (m, n) ps

t :: [String] -> [(Int, String)]
t (pattern:mismatches:text:[]) = sortBy sort' $ compute $ slice text
  where slice (t:ts)
          | length ts < length pattern = [t:ts]
          | otherwise = [t:(take sz ts)] ++ slice ts
        m = read mismatches :: Int
        sz = (length pattern - 1)
        compute slices = foldr (\s a -> (compute' s pattern s 0) ++ a) [] (slice text)
        compute' orig [] [] mm = [(mm, orig)]
        compute' orig [] t  mm 
          | mm + (length t) >= m = []
          | otherwise = [(mm + (length t), orig)]
        compute' orig p  [] mm
          | mm + (length p) >= m = []
          | otherwise = [(mm + (length p), orig)]
        compute' orig (p:ps) (t:ts) mm
          | mm >= m = []
          | p == t = compute' orig ps ts mm
          | otherwise = minimum' (t1 ++ t2 ++ t3)
          where t1 = (compute' orig ps (t:ts) (mm + 1))
                t2 = (compute' orig (p:ps) ts (mm + 1))
                t3 = (compute' orig ps ts (mm + 1))
                
g line = join' results
  where join' []  = "No match"
        join' lst = intercalate " " lst
        results = foldr (\x a -> (snd x):a) [] (t $ splitOn " " line)

main = do
        [inpFile] <- getArgs
        input <- readFile inpFile
        mapM_ putStrLn $ map g $ lines input
        

