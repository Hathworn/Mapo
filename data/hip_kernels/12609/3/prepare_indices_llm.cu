#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepare_indices(const unsigned num_keys, unsigned *data) {
    // Improve index calculation efficiency
    unsigned idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned idx_y = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned index = idx_x + idx_y * gridDim.x * blockDim.x;

    // Check if index is within bounds
    if (index < num_keys) {
        data[index] = index;
    }
}