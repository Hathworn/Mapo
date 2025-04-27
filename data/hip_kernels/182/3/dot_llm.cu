#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot(int *a, int *b, int *c) {

    __shared__ int prod[THREADS_PER_BLOCK]; // Shared memory
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    prod[threadIdx.x] = a[index] * b[index];

    __syncthreads();  // Threads synchronization

    // Parallel reduction within block
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        if (threadIdx.x % (2 * stride) == 0) {
            prod[threadIdx.x] += prod[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Atomic addition to global result
    if (threadIdx.x == 0) {
        atomicAdd(c, prod[0]); // Blocks reduction
    }
}