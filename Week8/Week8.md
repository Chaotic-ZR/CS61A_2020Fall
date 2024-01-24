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



# Project Ant

- When iterating through a list's copy and modify elements inside, if elements are mutable, then elements in the original list will change as well

- When using inheriting method, better use the closest one rather than the top one