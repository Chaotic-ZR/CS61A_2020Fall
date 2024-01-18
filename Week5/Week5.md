# Data Structure

## Containers

### List

- how to test whether an element is(not) in a list
	- ` a in lst1`
	- `b not in lst1`

### String

- `in / not in` can be used to find more than one elements inside a string

	- this is different from list

	-  ```python
		 >>> 'here' in "Where is him?"
		 True
		 >>> [2, 3, 4] in [1, 2, 3, 4, 5]
		 False
		 ```

	- 

- how to turn a expression inside a string into something executable

	- `exec(<expression>)`

## For Statements

- Sequence Unpacking in For Statements

-  ```python
	 same_count = 0
	 pairs = [[1, 2], [2, 2], [3, 2], [4, 4]]
	 for x, y in pairs: # every element can be unpacked in this case
	   if x == y:
	     same_count += 1
	 ```

## Advanced Sequence Operation

### List Comprehension

#### Conventional Names

- `apply_to_all` for map

- `keep_if` for filter

	[^]: 

	