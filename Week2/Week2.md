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
  - parameters will be determined if they are expressions or higer-order functions

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

## higher order function

- Definition: A function that takes a function as an **argument value** or returns
	a function as a **return value**

- The meaning of return: 将内容返回更高一级的environment

-  ```python
	 func <name> (<parameters>) [parent=<parent>] # 最后一个是函数所在框架（环境）
	 ```

- 函数所在frame（环境）是根据函数定义的地方确定的，而不是在函数调用的地方

## Currying



