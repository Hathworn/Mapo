#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    // Calculate global index
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary condition
    if (idx < vectorSize) {
        // Ensure non-zero to avoid division by zero error
        if (data[idx]!= 0.0f) {
            data[idx] = 1.0f / data[idx];
        }
    }
}