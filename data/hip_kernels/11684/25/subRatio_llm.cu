#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void subRatio(int n, float *a, float *b, float *c, float *result)
{
    // Use a shared memory buffer for coalesced global memory access
    extern __shared__ float shared[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < n)
    {
        // Load data into shared memory
        shared[threadIdx.x] = b[i] / c[i];
        
        // Ensure all threads have loaded the data
        __syncthreads();
        
        // Perform operation using shared memory
        result[i] = a[i] - shared[threadIdx.x];
    }
}