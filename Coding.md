## Binary Search

```Haskell
--Binary search

binarySearch :: [Int] -> Int -> Bool
binarySearch [] _ = False
binarySearch xs target
	| target == midVal = True
	| target < midVal = binarySearch left target
	| otherwise = binarySearch right target
where
	mid = length xs / 2
	midVal = xs !! mid
	left = take mid xs
	right = drop (mid + 1) xs
```

```Rust
fn binary_search(arr: &[i32], target: i32) -> bool {
	let mut low = 0;
	let mut high = arr.len();

	while low < high {
		let mid = (low + high) / 2;
		if arr[mid] == target {
			return true;
		} else if arr[mid] < target {
			low = mid + 1l
		} else {
			high = mid;
		}
	}
	false
}
```

## Calculate Average Function

```Haskell
calAverage :: [Double] -> Doulble
calAverage [] = 0
calculate xs = sum xs / fromIntergral (length xs)
```

```Rust
fn calAverage(numsL &[f64]) -> f64 {
	let sum: f64 = numbers.iter().sum();
	sum / number.len() as f64
}
```

## Remove Duplicates

```Haskell
removeDup :: Eq a => [a] -> [a]
removeDup = remove []
	where
		remove _ [] = []
		remove seen (x:xs)
			| x `elem` seen = remove seen xs
			| otherwise = x : remove (seen ++ [x]) xs
```

```Rust
use std::collections::HashSet;

fn removeDup<T: Eq + std::hash::Hash + Clone>(vec: Vec<T>) -> Vec<T> {
	let mut seen = HashSet::new();
	vec.into_iter().filter(|x| seen.insert(x.clone())).collect()
}
```

## map, filter, and anonymous


```Haskell
main :: IO ()
main = do
	let nums = [1, 2, 3, 4, 5]


	let squares = map (\x -> x*x) nums
	putStrLn $ "Squares: " ++ show squares

	let even = filter (\x -> x % 2 == 0) nums
	putStrLn $ "Even numbers: " ++ show evens

	let doubleEvens = map (\x -> x*x) (filter (\x -> x % 2 == 0) nums)
	putStrLn $ "Double evens: " ++ show doubleEvens
```


```Rust
fn main(){
	let nums = vec![1, 2, 3, 4, 5];
	
	let squares: Vec<_> = nums.iter().map(|x| x * x).collect();
	println!("Squares: {:?}", squares);

	let even_nums: Vec<_> = nums.iter().filter(|x| *x % 2 == 0).collect();
	println!("Even: {:?}", even_nums);

	let double_evens: Vec<_> = nums.iter()
		.filter(|x| *x % 2 == 0)
		.map(|x| x * 2)
		.collect()
	println!("Double evens {:?}", double_evens);

	let is_positive = |x: &i32 *x > 0;
	println!("All positive {}", nums.iter().all(is_positive));
}
```

## Case Expression

```Haskell
describeNum :: Int -> String
describeNum n = case n of
	0 -> "Zero"
	1 -> "One"
	x | x >= 2 && x <= 10 -> "Between two and ten"
	x | x < 0 -> "Negative number"
	_ -> "Greater than ten"

main :: IO ()
main = do
	let numbers = [1, 2, 3, 4]
	mapM_ (\n -> putStrLn $ show n ++ " is " ++ describeNum n) numbers
```

```Rust
fn describeNum(n: i32) -> &'static str {
	match n {
		0 => "Zero",
		1 => "One",
		2..=10 => "Between two and ten",
		_ if n < 0 => "Negative number",
		_ => "Greater than ten",
	}
}

fn main(){
	let numbers = vec![1, 2, 3, 4, 5];
	for n in numbers {
		println!("{} is: {}", n, describeNum(n));
	}
}
```