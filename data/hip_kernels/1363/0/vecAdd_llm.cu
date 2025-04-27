#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA kernel. Each thread takes care of one element of c
__global__ void vecAdd(int *a, int *b, int *c, int n)
{
    // Using shared memory to hold a and b sub-arrays for better performance
    extern __shared__ int sharedMemory[];
    int *sharedA = &sharedMemory[0];
    int *sharedB = &sharedMemory[blockDim.x];

    // Load data into shared memory
    int tid = threadIdx.x;
    int id = blockIdx.x * blockDim.x + tid;

    if (id < n) {
        sharedA[tid] = a[id];
        sharedB[tid] = b[id];
        __syncthreads();  // Ensure all data is loaded

        // Perform vector addition
        c[id] = sharedA[tid] + sharedB[tid];
    }
}