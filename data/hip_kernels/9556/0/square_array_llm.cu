#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Use shared memory for caching data
    extern __shared__ float cache[];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < N) {
        // Load from global to shared memory
        cache[threadIdx.x] = a[idx];
        __syncthreads();
        
        // Work on shared memory
        cache[threadIdx.x] *= cache[threadIdx.x];
        
        // Store back to global memory
        __syncthreads();
        a[idx] = cache[threadIdx.x];
    }
}