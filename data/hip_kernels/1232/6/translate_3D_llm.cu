#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void translate_3D(float* coords, size_t dim_z, size_t dim_y, size_t dim_x, float seg_z, float seg_y, float seg_x) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y * dim_z;
    
    // Check index is within bounds
    if(index < total) {
        // Apply translations without __syncthreads(); removed as there is no shared memory usage 
        coords[index] += seg_z;
        coords[index + total] += seg_y;
        coords[index + total * 2] += seg_x;
    }
}