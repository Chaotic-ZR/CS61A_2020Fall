# Function

> 有时候离开计算机思考问题也十分重要

## Environment Diagram

- 定义：环境图表是**一种记录（变量名）连接情况以及计算机程序状态的可视化工具**

- 类似于LEGB

- ``` python
	from operator import mul
	def square(square):
	  return mul(square, square)
	square(-2)
	```

	上述程序并不会报错，因为在func square是一个global的变量（函数可以看作变量），而func square内部的square首先会寻找local的变量，即参数，所以不会去global里寻找，因此没有冲突

## Function

### Function 特点

- 不需要调用者去深入探究如何实现的（抽象为一个功能）
- 只需要知道输入和输出，以及功能即可
- One function should only do **one** job
- Functions should be defined generally
	- 不要把函数总是局限在某个特定参数的情况
	- eg. square是pow的一个特例，所以没有必要单独写一个square的函数

> You are not allowed to repeat copying some certain code
>
> If you do, Use Functions!

### Function Test&Explanation

- Docstrings&Doctests

	- 在函数内使用三引号进行创建

	- 如何在程序运行中查看docstrings

		- use `python3 -i xxx.py`to enter
		- use `help(func_name)`to get the docstrings

	- ```python
		# 用于标识函数的作用以及案例输出
		def my_function():
			"""hello, this is the docstring of my_function 
		
			>>> my_function():
			2023
			"""
		# 以 ">>>" 开头的一段是doctests, 下面放了预计的输出
		```

	- 使用doctests的方法

		`python3 -m doctest lab01.py`

		如果正确的话，不会返回任何结果；错误的话会返回

- Assertion

	- used for test

		- create another file `filename_test.py`

		- the file should be like:

			```python
			def fib_test():
			        assert fib(2) == 1, 'The 2nd Fibonacci number should be 1'
			        assert fib(3) == 1, 'The 3rd Fibonacci number should be 1'
			        assert fib(50) == 7778742049, 'Error at the 50th Fibonacci number'
			```

		- then, we can use `pytest` to examine the functions