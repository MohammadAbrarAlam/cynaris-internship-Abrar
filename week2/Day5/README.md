# Week 2 – Day 5: NumPy for Data

# 1. Objective
Learn NumPy for efficient numerical operations and data analysis using arrays.

# 2. Learning Objectives
- Create and manipulate 1D, 2D, and 3D arrays.
- Perform vectorised operations.
- Understand broadcasting.
- Apply indexing, slicing, and Boolean masking.
- Calculate statistical measures.
- Compare NumPy performance with Python loops.

# 3. Tools & Technologies
- Python
- NumPy
- Jupyter Notebook
- Git & GitHub

# 4. Array Creation Functions

* `np.array()`: Creates an array 
| `np.zeros()`: reates an array filled with zeros .
| `np.ones()`:Creates an array filled with ones.
| `np.eye()`: Creates an identity-like matrix.
| `np.identity()`: Creates a square identity matrix.
| `np.arange()` : Creates values within a range.
| `np.linspace()` : Creates evenly spaced values. 
| `np.random.rand()` : Generates random decimal values.
| `np.random.randint()`: Generates random integers.
| `np.empty()` : Creates an uninitialised array.

# 5. Vectorised Operations:

Perform operations on complete arrays without writing explicit loops.

```python
np.add(a, b)
np.subtract(a, b)
np.multiply(a, b)
np.divide(a, b)
```

# 6. Aggregation Functions:

* `np.sum()`: Calculates total.
* `np.mean()`: Calculates average 
* `np.min()`: Finds minimum.
* `np.max()` : Finds maximum.
* `np.argmin()`: Returns minimum index.
* `np.argmax()` : Returns maximum index.
* `np.median()` : Calculates median.
* `np.std()` : Calculates standard deviation
* `np.var()` : Calculates variance 
* `np.prod()` : Calculates product 
* `np.cumsum()` : Calculates cumulative sum
* `np.cumprod()` :Calculates cumulative product

# 7. Percentile & Correlation

- `np.percentile()` – Finds a value at a given percentile.
- `np.corrcoef()` – Measures the correlation between variables.

Correlation ranges from -1 to +1. It does not prove causation.

# 8. Broadcasting

Broadcasting allows NumPy to perform operations on arrays with compatible shapes.

Example:

```python
arr = np.array([10, 20, 30])
print(arr * 2)
```

# 9. Indexing & Slicing

- Indexing: Access individual array elements.
- Slicing: Select a range of elements.
- Negative indexing: Access elements from the end.
- 2D indexing: Access rows and columns.
- 3D indexing: Access depth, rows, and columns.

```python
arr[0]
arr[-1]
arr[1:4]
arr[::-1]
```

# 10. Fancy Indexing

Select multiple elements using index arrays.

```python
arr = np.array([10, 20, 30, 40, 50])
print(arr[[0, 2, 4]])
```

# 11. Boolean Masking

Filter array elements using conditions.

```python
arr = np.array([10, 20, 30, 40, 50])
print(arr[arr > 25])
```

- `&` – AND
- `|` – OR
- `~` – NOT

# 12. Aggregation Across Axes

- `axis=0` – Performs operations column-wise.
- `axis=1` – Performs operations row-wise.

```python
np.sum(arr, axis=0)
np.sum(arr, axis=1)
```

# 13. Performance Benchmarking

Compare Python loops with NumPy operations on one million values.

```python
import numpy as np
import time

values = list(range(1_000_000))

start = time.time()
result = [x * 2 for x in values]
python_time = time.time() - start

start = time.time()
numpy_result = np.arange(1_000_000) * 2
numpy_time = time.time() - start

print("Python Time:", python_time)
print("NumPy Time:", numpy_time)
```

# 14. CIA Learning

- Understand broadcasting concepts.
- Explore NumPy in the data science stack.
- Learn how NumPy supports efficient numerical computation.

# 15. Git & GitHub Workflow

# Create Feature Branch

```bash
git checkout main
git pull origin main
git checkout -b feature/week-2-day-5
```

# Stage and Commit Changes

```bash
git add .
git commit -m "feat: numpy-analysis week-2-day-5 complete"
```

# Push to GitHub

```bash
git push -u origin feature/week-2-day-5
```

# Pull Request

**Title:** Week 2 Day 5 – NumPy for Data

**Description:**

Completed NumPy practical tasks covering array creation, vectorised operations, broadcasting, aggregation, statistical measures, indexing, slicing, Boolean masking, and performance benchmarking.

Included `numpy_analysis.ipynb` and `README.md`.

# 16. Learning Outcome

Learned how to create and manipulate NumPy arrays, perform numerical operations, apply statistical functions, filter data, and understand NumPy performance.

---

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 2 | **Day:** 5  
**Topic:** NumPy for Data  
**Repository:** `cynaris-internship-Abrar`  
**Technologies:** Python, NumPy, Jupyter Notebook, Git & GitHub