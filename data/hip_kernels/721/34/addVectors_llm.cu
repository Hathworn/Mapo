#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addVectors(int size, float *d_a, float *d_b, float *d_c)
{
    // Precalculate thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access latency
    extern __shared__ float cache[];
    
    if (tid < size)
    {
        cache[threadIdx.x] = d_a[tid] + d_b[tid]; // Load into shared memory
        __syncthreads();  // Ensure all writes to shared memory are completed

        d_c[tid] = cache[threadIdx.x]; // Write back to global memory
    }
}