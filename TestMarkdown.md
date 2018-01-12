
# Markdown Tests on Atom

## python code (functional)

```python
# basic approach
lst = []
for item in range(10):
  lst.append(item)
print(lst)

lst = []
for item in 'Word':
  lst.append(item)
print(lst)

# comprehensions
lst2 = [number for number in range(10)]
print(lst2)

lst2 = [letter for letter in 'Word']
print(lst2)

#x^2 : x in {0,1,2,...,10}
lst3 = [x**2 for x in range(0,10)]
print(lst3)
lst3 = [x**0.5 for x in range(0,10)]
print(lst3)
lst3 = [x**2 for x in range(0,11) if x % 2 == 0]
print(lst3)

help(print)


```

## R code block (functional)

```r
lst <- 0:10
lst

library('data.table')
dt <- as.data.table(lst)
dt
```
## add mathemtic equations

### references
* [Latex cheat sheet](https://wch.github.io/latexsheet/)
*

### with MathType
\[P\left( {X < A} \right) = \int_{ + \infty }^A {f\left( x \right)dx} \]

### pure LaTeX
Centered equation:
$$\exp^{γx}$$
embedded equation : $\exp^{γx}$
