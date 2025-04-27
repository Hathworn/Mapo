```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rsub_float(int n, float *a, float *b, float *sum)
{
    // Use shared memory to reduce global memory access latency
    extern __shared__ float shared_mem[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we only access valid memory locations
    if (i < n)
    {
        // Load data into shared memory
        shared_mem[threadIdx.x] = b[i] - a[i];
        __syncthreads();
        
        // Store the result back to global memory
        sum[i] = shared_mem[threadIdx.x];
    }
}