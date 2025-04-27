#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Vector arithmetic, scalar arithmetic, and other mathematical operations 
// truncated for brevity, assuming they are present before or after.

__global__ void vec_double2float(int n, float *output, double *input) {
    // Calculate global thread ID for 1D grid with 2D block.
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockDim.x * gridDim.x) * (blockIdx.y * blockDim.y + threadIdx.y);
    
    // Perform conversion for valid id.
    if (id < n) {
        output[id] = static_cast<float>(input[id]);
    }
}