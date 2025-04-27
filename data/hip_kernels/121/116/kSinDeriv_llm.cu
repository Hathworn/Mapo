#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSinDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Iterate over elements this thread should handle
    if (idx < numEls) {
        dest[idx] = a[idx] * __cosf(b[idx]); // Compute result
    }
}
```
