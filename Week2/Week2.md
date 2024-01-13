# Control&Environment

## Control Statements

### Control Statements & Condition Functions

- Notice the difference of the subsequent two code blocks

  ```python
  from math import sqrt
  if x >= 0:
    return sqrt(x)
  else:
    return 0
  ```

  ```python
  from math import sqrt
  def if_(c, t, f):
    if c:
      return t
    else:
      return f
  
  if_(x >= 0, sqrt(x), 0)
  ```

  - when inputting -16:
  	- the first one will go on well
  	- the second one, however, is wrong since `sqrt(-16)` is calculated when calling the function

## First Class Citizens

> remove repetition from your program

- use some function as parameters

	-  ```python
		 def summation (n, term):
		   n = abs(n)
		   return term(n)
		 ```

	this is a good way to subtract some repeated code to a few new functions

- functions as return value

	- remember the enclosed environment

