# Recursion

## Basic Knowledge

### Base Cases

- need conditional check
- it's evaluated without recursive calls

### Iteration VS Recursion

- Iteration is a special case of recursion
	- Iteration is like some abstraction of recursion
	- Iteration may be faster, but it's not so straight forward in meaning
- ![image-20240116100340777](Week4.assets/image-20240116100340777.png)

### Verifying Recursive Functions

1. Verifying the base case
2. Treat `fact` as a funcitonal abstraction()
3. Assume that `fact(n-1)` is correct
4. Verify that `fact(n)` is correct, assuming that `fact(n-1)` is correct

> 数学归纳法证明递归正确性（Induction）

## Up_Level

### Mutual Recursion

#### The Luhn Algorithm(Example)

- First: From the rightmost digit, which is the check digit, moving left, double the value of every second digit; if product of this doubling operation is greater than 9 (e.g., 7 * 2 = 14), then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5)

- Second: Take the sum of all the digits
- <img src="Week4.assets/image-20240116101314545.png" alt="image-20240116101314545" style="zoom:50%;" />

- ```python
	def luhn_sum(n):
	    """Return the digit sum of n computed by the Luhn algorithm.
			"""
	    if n < 10:
	        return n
	    else:
	        all_but_last, last = split(n)
	        return luhn_sum_double(all_but_last) + last
	
	def luhn_sum_double(n):
	    """Return the Luhn sum of n, doubling the last digit."""
	    all_but_last, last = split(n)
	    luhn_digit = sum_digits(2 * last)
	    if n < 10:
	        return luhn_digit
	    else:
	        return luhn_sum(all_but_last) + luhn_digit
	```

> 递归步骤交替进行，使用双重递归



### Conversion between Recursion and Iteration

#### Recursion to Interation

- figure out what state must be maintained by the interative function

- 1. what's the input of one time in recursion
	2. what's the return value of one time in recursion

	 ```python
	 def sum_digits(n):
	 	"""Return the sum of the digits of positive integer n.""" 
	 	if n < 10:
	 		return n 
	   else:
	 		all_but_last, last = split(n)
	 		return sum_digits(all_but_last) + last
	 ```

-  ```python
	 def sum_digits_iter(n):
	     """Sum digits iteratively.
	 
	     >>> sum_digits_iter(11408855402054064613470328848384)
	     126
	     """
	     digit_sum = 0 # base step
	     while n > 0:
	         n, last = split(n)
	         digit_sum = digit_sum + last # similar to the return of recursion
	     return digit_sum
	 
	 def sum_digits_rec(n, digit_sum):
	     """Sum digits using recursion, based on iterative version.
	 
	     >>> sum_digits_rec(11408855402054064613470328848384, 0)
	     126
	     """
	     if n == 0:
	         return digit_sum
	     else:
	         n, last = split(n)
	         return sum_digits_rec(n, digit_sum + last)
	 ```

#### Interation to Recursion

- The state of an iteration can be passed as arguments
	- `n, digit_sum` are both the state/process value of iteration(changes as iteration goes)
- example is listed above