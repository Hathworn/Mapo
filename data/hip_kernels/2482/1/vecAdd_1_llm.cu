#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_1(double *a, double *b, double *c, int n)
{
    // Use shared memory for reduced global memory access
    extern __shared__ double sharedMem[];

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Preload data into shared memory
    if (id < n) {
        sharedMem[tid] = a[id];
        __syncthreads(); // Ensure all threads load into shared memory

        // Perform addition using shared memory
        c[id] = sharedMem[tid] + b[id];
    }
}