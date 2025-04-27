#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate the global index with improved readability
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check if index is within bounds before operating
    if (i < n) {
        // Perform multiply-add operation with a single memory access for c[i]
        float temp = a[i] * b[i];
        atomicAdd(&c[i], temp); // Ensure thread-safety with atomic operation
    }
}