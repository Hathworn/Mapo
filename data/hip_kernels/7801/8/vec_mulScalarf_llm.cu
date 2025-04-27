```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for vector-scalar multiplication
__global__ void vec_mulScalarf(size_t n, float* result, const float* x, float y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize thread indexing
    if (id < n) // Boundary check
    {
        result[id] = x[id] * y; // Vector-scalar multiplication
    }
}
```
