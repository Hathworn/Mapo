#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel execution by using shared memory to reduce redundant memory accesses
__global__ void vec_erfcf (size_t n, float *result, float *x)
{
    // Calculate global thread index
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    // Use shared memory for the current block
    extern __shared__ float shared[];
    
    if (id < n)
    {
        // Load into shared memory
        shared[threadIdx.x] = x[id];
        __syncthreads();  // Ensure all loads are done
        
        // Perform computation using shared memory
        result[id] = erfcf(shared[threadIdx.x]);
    }
}