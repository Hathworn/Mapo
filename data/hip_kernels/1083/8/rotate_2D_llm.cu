#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rotate_2D(float* coords, size_t dim_y, size_t dim_x, float cos_angle, float sin_angle) {
    // Calculate linear index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y;

    // Ensure index is within bounds
    if (index < total) {
        float old_y = coords[index];
        float old_x = coords[index + total];

        // Compute new coordinates
        float new_y = cos_angle * old_y + sin_angle * old_x;
        float new_x = -sin_angle * old_y + cos_angle * old_x;

        // Assign new coordinates
        coords[index] = new_y;
        coords[index + total] = new_x;
    }
}