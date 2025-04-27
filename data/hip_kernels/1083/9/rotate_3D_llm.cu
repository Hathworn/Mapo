```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotate_3D(float* coords, size_t dim_z, size_t dim_y, size_t dim_x, float* rot_matrix) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y * dim_z;

    if (index < total) {
        float old_z = coords[index];
        float old_y = coords[index + total];
        float old_x = coords[index + 2 * total];
        
        // Compute new coordinates using rotation matrix
        float new_z = old_z * rot_matrix[0] + old_y * rot_matrix[3] + old_x * rot_matrix[6];
        float new_y = old_z * rot_matrix[1] + old_y * rot_matrix[4] + old_x * rot_matrix[7];
        float new_x = old_z * rot_matrix[2] + old_y * rot_matrix[5] + old_x * rot_matrix[8];
        
        // Store the result back without using unnecessary __syncthreads
        coords[index] = new_z;
        coords[index + total] = new_y;
        coords[index + 2 * total] = new_x;
    }
}