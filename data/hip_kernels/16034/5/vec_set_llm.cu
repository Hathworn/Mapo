#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with block-level parallelism
__global__ void vec_set(int n, double *result, double value)
{
    // Calculate global index using blockIdx and threadIdx
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds before storing
    if (id < n) {
        result[id] = value;
    }
}