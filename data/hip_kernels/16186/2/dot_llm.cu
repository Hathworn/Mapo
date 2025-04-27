```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int *a, int *b, int *c) {
    __shared__ int temp[THREADS_PER_BLOCK];
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int localIndex = threadIdx.x;

    // Load data in shared memory
    temp[localIndex] = a[index] * b[index];
    __syncthreads();

    // Reduce in shared memory tree pattern
    for (int stride = THREADS_PER_BLOCK / 2; stride > 0; stride /= 2) {
        if (localIndex < stride) {
            temp[localIndex] += temp[localIndex + stride];
        }
        __syncthreads();
    }

    // Write result of block to global memory
    if (localIndex == 0) {
        atomicAdd(c, temp[0]);
    }
}
```
