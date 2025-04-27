#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sxypz_kernel_large(float a, const float* x, const float* y, const float* z, float* result, unsigned int len, unsigned int rowsz) {
    // Calculate a unique 1D index within the grid
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * rowsz;

    // Ensure all threads with valid indices compute the result
    if (idx < len) {
        // Load values before computing result to reduce global memory access
        float x_val = x[idx];
        float y_val = y[idx];
        float z_val = z[idx];
        
        // Compute and store the result
        result[idx] = a * x_val * y_val + z_val;
    }
}