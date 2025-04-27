#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void longKernel(float *data, int N, float value) {
    // Get global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds to prevent overflow
    if (idx < N) {
        data[idx] += value;
    }
}
```
