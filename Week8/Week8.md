# Object

### Attribute

- `<expression>.<name>`
	- name会先和对象的属性匹配，如果匹配不到再和类的属性匹配
	- this will not happen when doing assignment

### Inheritance and Composition

- Inheritance is best for representing is-a relationships
	- E.g. a checking account is a specific type of account 
	- So, CheckingAccount inherits from Account

- Composition is best for representing has-a relationships
	- E.g. a bank has a collection of bank accounts it manages
	- So, A bank has a list of accounts as an attribute

### Multiple Inheritance

```python
class Complete_Account(CheckingAccount, SavingsAccount):
    """A bank account that charges for everything."""
    def __init__(self, account_holder):
        self.holder = account_holder
        self.balance = 1 # A free dollar!
```

- As in the example above, the `Complete Account` has both saving and checking function since it inherits from two different classes
- However, multiple inheritance can make program complicated, which is not recommended



# Representation

## String Representation

### The repr string for an object

- `__repr__` returns Python-interpretable strings
- Calling the object directly usually gives this representation



### The str string for an object

- `__str__` returns human-readable strings
- `print` usually gives this representation



## Special Method Names

- `isinstance(<object>, <type>)` is used to test whether the object is certain type or not
- `__radd__` means add from right to left, `__add__` means add from left to right

### Property

```python
class Test():
	def __init__(...):
        ...
    @property
    def property1(self)
    	return 1

>>> a = Test() 
>>> a.property1 # although property1 is a function, but after adding @property, it becomes an instance attribute
>>> 1
```

### Cross-type Operation

#### Type dispatching

First, we can add class attribute: type_tag

Then, we can use type tag to switch between operation moods

```python
class Number:
    def __add__(self, other):
        if self.type_tag == other.type_tag:
            return self.add(other)
        elif (self.type_tag, other.type_tag) in self.adders: # switching moods
            return self.cross_apply(other, self.adders)
    
    def __mul__(self, other):
        if self.type_tag == other.type_tag:
            return self.mul(other)
        elif (self.type_tag, other.type_tag) in self.multipliers:
            return self.cross_apply(other, self.multipliers)
    
    def cross_apply(self, other, cross_fns):
        cross_fn = cross_fns[(self.type_tag, other.type_tag)]
        return cross_fn(self, other)
    
    adders = {("com", "rat"): add_complex_and_rational, ("rat", "com"): add_rational_and_complex} # dictionary for mood switching
    multipliers = {
        ("com", "rat"): mul_complex_and_rational,
        ("rat", "com"): mul_rational_and_complex
        }
```

#### Coercion(convert type before operation)

```python
class Number:
    def __add__(self, other):
        x, y = self.coerce(other) # convert type first, then do the operation
        return x.add(y)
    
    def __mul__(self, other):
        x, y = self.coerce(other)
        return x.mul(y)
    
    def coerce(self, other): # type converting function
        if self.type_tag == other.type_tag:
            return self, other
        elif (self.type_tag, other.type_tag) in self.coercions:
            return (self.coerce_to(other.type_tag), other)
        elif (other.type_tag, self.type_tag) in self.coercions:
            return (self, other.coerce_to(self.type_tag))
    
    def coerce_to(self, other_tag):
        coercion_fn = self.coercions[(self.type_tag, other_tag)]
        return coercion_fn(self)
    
    coercions = {('rat', 'com'): rational_to_complex}

```

# Composition

## Linked List

### Processing

- Core: Recursion

- Be careful about loop in linked lists

	- ```python
		s = Link(1, Link(2, Link(3)))
		s.first = 5
		t = s.rest
		>>> s.first
		5
		>>> s.rest.rest.rest.rest.rest.first
		2
		```

	- ![image-20240129113427948](Week8.assets/image-20240129113427948.png)



# Project Ant

- When iterating through a list's copy and modify elements inside, if elements are mutable, then elements in the original list will change as well

- When using inheriting method, better use the closest one rather than the top one