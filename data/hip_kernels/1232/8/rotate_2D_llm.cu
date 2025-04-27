#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rotate_2D(float* coords, size_t dim_y, size_t dim_x, float cos_angle, float sin_angle){
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y;
    
    if(index < total){
        // Pre-calculate indices
        size_t idx_y = index;
        size_t idx_x = index + total;
        
        // Fetch old coordinates
        float old_y = coords[idx_y];
        float old_x = coords[idx_x];
        
        // Calculate new coordinates
        float new_y = cos_angle * old_y + sin_angle * old_x;
        float new_x = -sin_angle * old_y + cos_angle * old_x;
        
        // Write new coordinates
        coords[idx_y] = new_y;
        coords[idx_x] = new_x;
    }
}