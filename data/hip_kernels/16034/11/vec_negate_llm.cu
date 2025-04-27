#include "hip/hip_runtime.h"
#include "includes.h"

// The global kernel function for negating a vector
__global__ void vec_negate(int n, double *result, double *x) {
    // Calculate unique thread index across grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (id < n) {
        result[id] = -x[id]; // Negate the element
    }
}
```
