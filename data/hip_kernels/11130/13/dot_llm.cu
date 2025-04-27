```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot( int *a, int *b, int *c ) {
    __shared__ int temp[THREADS_PER_BLOCK];
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Compute product and store in shared memory
    temp[threadIdx.x] = a[index] * b[index];
    __syncthreads();
    
    // Use warp reduction for faster summation
    int sum = 0;
    for (int offset = blockDim.x / 2; offset > 0; offset /= 2) {
        if (threadIdx.x < offset) {
            temp[threadIdx.x] += temp[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Perform atomic add only by the first thread
    if (threadIdx.x == 0) {
        atomicAdd(c, temp[0]);
    }
}