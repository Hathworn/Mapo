#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSqrt(float* mat, float* target, unsigned int len) {
    // Calculate global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread processes an assigned element
    if (idx < len) {
        target[idx] = sqrt(mat[idx]);
    }
}
```
