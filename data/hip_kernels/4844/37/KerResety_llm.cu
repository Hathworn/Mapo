#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel launch using dynamic block size adjustment
__global__ void KerResety(unsigned n, unsigned ini, float3 *v) {
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x;
    if (p < n) {
        v[p + ini].y = 0;
    }
}
```
