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

	- ```python
		s = 'x = 5 + 2; print(x)'
		
		>>> exec(s)
		7
		```
	
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




# Processing Container Values

## Sequence Aggregation

### Sum

```python
sum(iterable, start) -> value
# the type of start decide the type of addition
# start is default to be 0(int)

>>> sum([[1, 2]], [0])
[0, 1, 2]
```

### Max

```python
max(iterable, key=<func>) -> value
# <func> is optional

>>> max(-4, 1, 2, key=lambda x: x*x)
-4(based on the output of key function)

```

### All/Any

- 合取与析取
- `all`默认为True
- `any`默认为False



# Data Abstraction

## Why Data Abstraction

- Compound values combine other values together
	- A date: a year, a month, and a day
	- A geographic position: latitude and longitude
- Data abstraction lets us manipulate compound values as units
- Isolate two parts of any program that uses data
	- How data are represented (as parts)
	- How data are manipulated (as units)
- Data abstraction: A methodology by which functions enforce an abstraction barrier between **representation** and **use**

## Abstaction Barriers

- When one place(function) is changed, other related funciton can take advantage of the change while not making any changes
- <img src="Week5.assets/image-20240119100039316.png" alt="image-20240119100039316" style="zoom:100%;" />

- The higher Abstaction level we are in, the easier it is to write program
	- we don't need to care about how the list is implemented when using list
	- don't cross the line between two different layers
		- when implmenting the higher level, just use the lower one level's function as an abstraction rather than look into it or skip levels
- Violating Abstraction Barriers
	- <img src="Week5.assets/image-20240119100919952.png" alt="image-20240119100919952" style="zoom:20%;" />

## Data Representation

- Data abstraction uses selectors and constructors to define behavior
- We need to guarantee that constructor and selector functions work together to specify the right behavior
	- Behavior condition: If we construct rational number x from numerator n and denominator d, then numer(x)/denom(x) must equal n/d
	- If behavior conditions are met, then the representation is valid

> You can recognize an abstract data representation by its behavior

| Type        | Function                                         |      |
| ----------- | ------------------------------------------------ | ---- |
| Arithmetic  | Do the process and calculation                   |      |
| Selector    | Select parts from the whole data                 |      |
| Constructor | the most basic thing in a self-defined datatype. |      |

## Example: Rational Numbers

```python
# Rational arithmetic()


def add_rational(x, y):
    """The sum of rational numbers X and Y."""
    nx, dx = numer(x), denom(x)
    ny, dy = numer(y), denom(y)
    return rational(nx * dy + ny * dx, dx * dy)


def mul_rational(x, y):
    """The product of rational numbers X and Y."""
    return rational(numer(x) * numer(y), denom(x) * denom(y))


def rationals_are_equal(x, y):
    """True iff rational numbers X and Y are equal."""
    return numer(x) * denom(y) == numer(y) * denom(x)


def print_rational(x):
    """Print rational X."""
    print(numer(x), "/", denom(x))


# Constructor and selectors


def rational(n, d):
    """A representation of the rational number N/D."""
    return [n, d]


def numer(x):
    """Return the numerator of rational number X."""
    return x[0]


def denom(x):
    """Return the denominator of rational number X."""
    return x[1]


# Improved specification

from fractions import gcd

# this is the constructor
def rational(n, d): 
    """A representation of the rational number N/D."""
    g = gcd(n, d)
    return [n // g, d // g]

# these are selectors
def numer(x):
    """Return the numerator of rational number X in lowest terms and having
    the sign of X."""
    return x[0]


def denom(x):
    """Return the denominator of rational number X in lowest terms and positive."""
    return x[1]

```

## Addition for recursion

```python
def fact(n, k): 
  if n == 0:
    return k # return the real answer
  else:
    return fact(n - 1, n * k) # manipulate the arguments instead of manipulating the return statement
  
def fact(n):
  if n == 0:
    return 1
  else:
    return n * fact(n - 1)
```

# Experience from project "cats"

When a recursion has different recursive steps, and we need the minimal step in all to reach the target

below is the recursive part of a function, we can use min/max to reach the optimal solution for a question

```python
add_diff = pawssible_patches(start, goal[1:], limit - 1)
remove_diff = pawssible_patches(start[1:], goal, limit - 1)
substitute_diff = pawssible_patches(start[1:], goal[1:], limit - 1)
return 1 + min(add_diff, remove_diff, substitute_diff)
```



