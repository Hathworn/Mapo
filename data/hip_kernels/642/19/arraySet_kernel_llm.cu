#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to set array values
__global__ void arraySet_kernel(unsigned int* d_vals, unsigned int value, size_t num_vals)
{
    // Calculate global index
    unsigned int gIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficient check and set value
    if (gIdx < num_vals) {
        d_vals[gIdx] = value;
    }
}