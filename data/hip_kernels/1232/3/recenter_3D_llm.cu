#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void recenter_3D(float* coords, size_t dim_z, size_t dim_y, size_t dim_x) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y * dim_z;
    
    // Ensure index is within bounds to prevent unnecessary calculations
    if (index < total) {
        float z_center = (float)dim_z / 2.0f; // Precompute to reduce repeated calculations
        float y_center = (float)dim_y / 2.0f; 
        float x_center = (float)dim_x / 2.0f; 

        coords[index] += z_center;
        coords[index + total] += y_center;
        coords[index + 2 * total] += x_center;
    }
}