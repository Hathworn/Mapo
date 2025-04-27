#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *c, int *d) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Use blockIdx to calculate global thread ID

    if (tid < N) { // Add bounds check for safety
        d[tid] += c[tid];
    }
}
```
Note: Ensure `N` is properly defined to represent the total number of elements.