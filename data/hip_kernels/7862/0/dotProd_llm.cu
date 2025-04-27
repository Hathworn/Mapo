#include "hip/hip_runtime.h"
#include "includes.h"

const int THREADS_PER_BLOCK = 32;
const int N = 2048;

__global__ void dotProd(int *a, int *b, int *c) {
    __shared__ int temp[THREADS_PER_BLOCK];
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Each thread computes its product and stores in shared memory
    int t = (index < N) ? a[index] * b[index] : 0;

    // Reduce within a block
    temp[threadIdx.x] = t;
    __syncthreads();

    // Parallel reduction code (no loop unrolling for simplicity)
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            temp[threadIdx.x] += temp[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Sum results from blocks and write to global memory
    if (threadIdx.x == 0) {
        atomicAdd(c, temp[0]); // Use atomic operation to avoid race conditions
    }
}