#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    // Use threadIdx and blockIdx to parallelize the loop
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        data[idx] += value;  // Only process assigned element
    }
}

```
