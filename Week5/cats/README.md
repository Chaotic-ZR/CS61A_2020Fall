## Measurement

### about(*topic*)

- Input: <list>topic: contains topic words;
- Output: <function> 
	- Input: <string>paragraph
	- Output:<bool>: whether paragraph contains any words in topic
- Process:
	- Ignore Upper or Lower cases

### accuracy(*typed*, *reference*)

- Input:
  - <string>typed: the string typed by user
  - <string>reference: the string for reference
- Output:
  - <float>: representing percentage of how much typed is correct
- Process:
  - Uppercase matters!
  - 标点有效

### wpm(*typed*, *elapsed*)

- Notice:
	- blank is counted in character counts
	- 5 characters makes up a word



## Correcting Words

### autocorrect(*user_word*, *valid_words*, *diff_function*, *limit*)

- Input:

	- <string>user_word
	- <list>valid_words
	- <function>diff_function
		- definition: `length_diff(w1, w2, limit)`
		- return: <int>difference value
	- <int>limit

- Process:

	- user_word in valid_words:
		- return user_word
	- User_word not in valid_words:
		- Diff > limit
			- return user_word
		- else
			- return the most similar word

- Notice:

	- words are all lowercase and have no punctuation.

	

### shifty_shifts(*start*, *goal*, *limit*)

- Process
	- same length
		- return the min number of characters changed
	- different length
		- do the same length method
		- add the diff length
	- diff bigger than limit
		- return limit+1 or anything bigger

### pawssible_patches(*start*, *goal*, *limit*):

