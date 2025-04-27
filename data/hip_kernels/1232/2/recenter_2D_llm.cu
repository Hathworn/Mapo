#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void recenter_2D(float* coords, size_t dim_y, size_t dim_x) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total_elements = dim_x * dim_y;
    // Remove __syncthreads as it is not needed; each thread works on unique data.
    if (index < total_elements) {
        float half_dim_y = (float)dim_y / 2.0f; // Pre-compute once per thread.
        float half_dim_x = (float)dim_x / 2.0f; // Pre-compute once per thread.
        coords[index] += half_dim_y;
        coords[index + total_elements] += half_dim_x;
    }
}