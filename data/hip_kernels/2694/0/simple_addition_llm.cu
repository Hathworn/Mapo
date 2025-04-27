#include "hip/hip_runtime.h"
#include "includes.h"

// Vector addition optimized with shared memory and loop unrolling
__global__ void simple_addition(int *a, int *b, int *c, int len)
{
    // Calculate global thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure tid does not exceed array length
    if (tid < len) {
        // Load data into shared memory (optimization)
        __shared__ int sharedA[256]; // adjust size according to blockDim.x
        __shared__ int sharedB[256]; // adjust size according to blockDim.x
        sharedA[threadIdx.x] = a[tid];
        sharedB[threadIdx.x] = b[tid];
        __syncthreads();

        // Perform addition
        c[tid] = sharedA[threadIdx.x] + sharedB[threadIdx.x]; // optimizing memory access

        // Use loop unrolling for further performance improvement
        if (threadIdx.x + 1 < blockDim.x && tid + 1 < len)
            c[tid + 1] = a[tid + 1] + b[tid + 1];
    }
}