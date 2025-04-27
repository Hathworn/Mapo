#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void translate_2D(float* coords, size_t dim_y, size_t dim_x, float seg_y, float seg_x) {
    // Compute the flattened index (2D index to 1D index)
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y;
    
    // Ensure within bounds
    if(index < total) {
        // Perform translation by adding segment offsets
        coords[index] += seg_y;
        coords[index + total] += seg_x;
    }
    // __syncthreads() is unnecessary outside of conditional logic affecting memory access
}