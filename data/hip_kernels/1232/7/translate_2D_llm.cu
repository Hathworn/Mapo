#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void translate_2D(float* coords, size_t dim_y, size_t dim_x, float seg_y, float seg_x) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y;
    // Remove unnecessary __syncthreads(), as there is no inter-thread dependency
    if (index < total) {
        coords[index] += seg_y;
        coords[index + total] += seg_x;
    }
}