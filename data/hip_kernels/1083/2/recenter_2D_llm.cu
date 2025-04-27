#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void recenter_2D(float* coords, size_t dim_y, size_t dim_x) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within the bounds
    if (index < dim_x * dim_y) {
        coords[index] += dim_y * 0.5f;                       // Simplified division
        coords[index + dim_x * dim_y] += dim_x * 0.5f;       // Simplified division
    }
}