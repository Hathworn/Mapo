#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(int* __restrict__ a, int* __restrict__ b, int* __restrict__ c, int n) {
    // Calculate global thread ID (tid)
    int tid = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Use shared memory to minimize global memory access
    __shared__ int sharedA[BLOCK_SIZE];
    __shared__ int sharedB[BLOCK_SIZE];

    // Load data into shared memory
    if (tid < n) {
        sharedA[threadIdx.x] = a[tid];
        sharedB[threadIdx.x] = b[tid];
    }
    __syncthreads();

    // Vector boundary guard
    if (tid < n) {
        // Each thread adds a single element
        c[tid] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}
```
Note: `BLOCK_SIZE` should be defined elsewhere to match the `blockDim.x`.