
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
		}
	}
}
```