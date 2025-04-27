#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c, int N) {
    // Calculate linear index for 1D grid
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    // Check boundary condition to avoid out-of-bounds access
    if (index < N) {
        c[index] = a[index] + b[index];
    }
}
```
