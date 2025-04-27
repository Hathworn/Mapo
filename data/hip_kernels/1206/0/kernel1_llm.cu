#include "hip/hip_runtime.h"
#include "includes.h"

// Initialize array to 0
__global__ void kernel1(int N, int *d_array) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    if (i < N) {
        d_array[i] = 0; // Initialize to 0
    }
}
```
