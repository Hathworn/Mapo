#include "hip/hip_runtime.h"
#include "includes.h"

// Macro definition here

extern "C"

// Optimized global kernel function
__global__ void vec_floor(int n, double *result, double *x) {
    // Calculate unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             blockIdx.y * blockDim.x * gridDim.x + threadIdx.y * blockDim.x;
    
    // Use a more efficient read pattern
    if (id < n) {
        result[id] = floor(x[id]);  // Perform floor operation
    }
}