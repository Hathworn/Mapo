#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *res, int x, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Exit if thread index is out of bounds
    if (tid >= n)
    {
        return;
    }

    // Use a smaller shared memory size for efficiency
    extern __shared__ int sharedMemory[];
    int *s_a = sharedMemory;
    int *s_b = &s_a[blockDim.x];
    int *s_res = &s_b[blockDim.x];
    
    // Load data into shared memory
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];

    __syncthreads(); // Ensure all loads are done before computing

    // Perform computation
    s_res[threadIdx.x] = s_a[threadIdx.x] - (s_b[threadIdx.x] * x);

    __syncthreads(); // Ensure computation is complete

    // Write result back to global memory
    res[tid] = s_res[threadIdx.x];
}