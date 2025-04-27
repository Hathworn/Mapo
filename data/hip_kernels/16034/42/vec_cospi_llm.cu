#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

//===========================================================================
// Vector math (two arguments)
//===========================================================================

// WARNING : device_sum size should be gridDim.x
__global__ void vec_cospi(int n, double *result, double *x) {
    // Calculate a 1D linear index from 2D grid and block indices for simplicity
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             blockIdx.y * gridDim.x * blockDim.x + threadIdx.y * blockDim.x;

    // Ensure index is within bounds before calculating
    if (id < n) {
        result[id] = cospi(x[id]); // Compute cosine of pi times element
    }
}