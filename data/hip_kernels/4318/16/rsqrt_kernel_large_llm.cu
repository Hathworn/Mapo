#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rsqrt_kernel_large(float* x, unsigned int len, unsigned int rowsz) {
    // Compute global index
    unsigned int idx = blockIdx.y * rowsz + blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if idx is within bounds and perform operation
    if (idx < len && x[idx] > 0) {
        x[idx] = rsqrtf(x[idx]);  // Use rsqrtf for better performance with float
    }
}