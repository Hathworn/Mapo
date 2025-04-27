#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* a, int* b, int* c) {
    // Use threadIdx.x and blockDim.x for parallel computation
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (index < N) { 
        c[index] = a[index] + b[index];
    }
}
```
