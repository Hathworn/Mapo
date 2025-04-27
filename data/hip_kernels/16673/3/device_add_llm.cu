#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c) {
    // Calculate global index
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if index is within bounds
    if(index < N) {
        c[index] = a[index] + b[index];
    }
}
```
Note: Make sure `N` is defined elsewhere in your code to specify the size of arrays.