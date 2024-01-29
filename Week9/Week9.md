# Efficiency

## Memorization

- Below is a decorator for tmp info memorization to avoid repeated computation

```python
def memo(f):
    cache = {} # store tmp info
    
    def memoized(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]
    
    return memoized

```

