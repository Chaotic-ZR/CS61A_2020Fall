# Exception

## Assert

- `assert <expression>, <string>`
- When expression is wrong, raise error with string: `Assertion Error: <string>`
- How to disable assert
	- `python3 -O xxx.py `(O stands for optimize)

## Raise

- `raise <error expression>`
- `raise TypeError('Bad argument')`

## Try

```python
try:
    <try suite>
except <Error> as <name>:
    <except suite>
```

