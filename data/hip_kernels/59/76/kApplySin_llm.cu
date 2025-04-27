#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplySin(float* mat, float* target, unsigned int len) {
    // Use shared memory to store intermediate results
    extern __shared__ float sharedMem[];

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int tid = threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    if (idx < len) {
        // Load data into shared memory
        sharedMem[tid] = __sinf(mat[idx]);
        __syncthreads();

        // Write the result back to global memory
        target[idx] = sharedMem[tid];
    }
}
```
