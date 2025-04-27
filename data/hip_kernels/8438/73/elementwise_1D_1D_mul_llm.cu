#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    // Calculate thread id
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure tid does not exceed size boundary
    if (tid < size) {
        out[tid] = in1[tid] * in2[tid];
    }
}
```
