#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kPowMatrix(float* mat, float* pow, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid memory access
    if (idx < len) {
        target[idx] = powf(mat[idx], pow[idx]);
    }
}
```
