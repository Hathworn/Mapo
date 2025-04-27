#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory for efficient access
__global__ void binarize_i32 (int* vector, int threshold, int* output, int len) {
    __shared__ int sharedVector[256]; // Allocate shared memory space
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Load data into shared memory
    if (idx < len) {
        sharedVector[threadIdx.x] = vector[idx];
        __syncthreads(); // Ensure all threads have loaded their data
        // Perform computation using shared memory
        output[idx] = sharedVector[threadIdx.x] > threshold ? 1 : 0;
    }
}
```
