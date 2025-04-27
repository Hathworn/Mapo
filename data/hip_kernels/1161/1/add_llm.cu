#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int N, double *a, double *b)
{
    // Use shared memory to minimize repeated access to global memory
    extern __shared__ double shared_a[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < N)
    {
        // Load data into shared memory
        shared_a[threadIdx.x] = a[tid];
        __syncthreads();

        // Perform computation using shared memory
        b[tid] = shared_a[threadIdx.x] * shared_a[threadIdx.x];
    }
}