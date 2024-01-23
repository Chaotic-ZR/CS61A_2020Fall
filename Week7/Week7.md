# Mutation and Iteration

## Mutation

### Mutable Default Arguments are Dangerous

- If default arguments are mutable, they will keep even if the function is called again(like attributes of an object)

### How to change list while iterating through it

- Use while(the following is an example)
	```python
	i, l = 0, 2 * len(lst)
	while i < l:
	    if i >= len(lst):
	        break
	    if lst[i] == entry:
	        lst[i + 1:i + 1] = [elem]
	        i += 1
	    i += 1
	```



### Nonlocal Variables

- Nonlocal variables can be used to pass status with higher order functions

- `withdraw`function can be called many times, and `balance` will changed overtime(instead of going back to origin state)

	 ```python
	def make_withdraw(balance):
	    """Return a withdraw function that draws down balance with each call."""
	    def withdraw(amount):
	        nonlocal balance                 # Declare the name "balance" nonlocal
	        if amount > balance:
	            return 'Insufficient funds'
	        balance = balance - amount       # Re-bind the existing balance name
	        return balance
	    return withdraw
	```



## Iteration

### Iterator

- `iter(<iterable>)` which returns an iterator will just mark a sign on an iterable sequence
	- iterator can only be used once(can't going back)
	- but iterable values can be used many times(they will reset after each call)
- and `next(<iterator>)` will return the current value and move the sign to the next element
- <img src="Week7.assets/image-20240122194337220.png" alt="image-20240122194337220" style="zoom:35%;" />
- iteration for dictionary
	- the order of iteration for a dictionary is based on the order in which they were added.
	- the size of dictionary shouldn't be changed when iterating through its iterator

### Built-in Functions for Iteration

- Many built-in Python sequence operations return iterators that compute results lazily 
	- map(func, iterable): Iterate over func(x) for x in iterable   
	- filter(func, iterable): Iterate over x in iterable if func(x)
	- zip(first_iter, second_iter): Iterate over co-indexed (x, y) pairs
	- reversed(sequence): Iterate over x in a sequence in reverse order

- To view the contents of an iterator, place the resulting elements into a container
	- list(iterable): Create a list containing all x in iterable
	- tuple(iterable): Create a tuple containing all x in iterable
	- sorted(iterable): Create a sorted list containing x in iterable


### Generator

- it's a special kind of iterator

- it actually uses generator function

- A generator can be used to represent infinite sequence

  - the generator function will go through every yield when a `next()` is called

  	 ```python 
  	def my_generator(x):
  	    for i in range(x):
  	        yield i
  	```


#### Yield

- when reaching `yield`, the function would act like there is a return, but after calling the another`next()`(or calling the function again), the function will resume from where it stopped.
- So, a function with yield is actually a generator/iterator, where yield serves as a stop sign, the function will take a rest there, and move on if called again.
- when writing a generator, we can take yield as return at beginning, and then try to convert return into yield

- `yield from g` (g is a generator)
	- It's equivalent to `for x in g: yield x `
	- So that we yield an element we want rather than yield a generator