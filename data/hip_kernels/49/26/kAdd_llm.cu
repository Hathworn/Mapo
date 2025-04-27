#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd(float* a, float* b, float* dest, unsigned int numEls, float scaleA, float scaleB) {
    // Calculate the global index using the block and thread size
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over data with stride of total number of threads
    for (unsigned int i = idx; i < numEls; i += gridDim.x * blockDim.x) {
        // Perform scaled addition
        dest[i] = scaleA * a[i] + scaleB * b[i];
    }
}
```
