#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void recenter_3D(float* coords, size_t dim_z, size_t dim_y, size_t dim_x) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y * dim_z;
    
    // Efficient memory access and avoiding re-computation
    if (index < total) {
        float half_dim_z = (float)dim_z / 2.0f;
        float half_dim_y = (float)dim_y / 2.0f;
        float half_dim_x = (float)dim_x / 2.0f;

        coords[index] += half_dim_z;
        coords[index + total] += half_dim_y;
        coords[index + 2 * total] += half_dim_x;
    }
    // Remove unnecessary __syncthreads(); as threads do not communicate
}