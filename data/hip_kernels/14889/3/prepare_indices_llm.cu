#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepare_indices(const unsigned num_keys, unsigned *data) {
    // Use 2D indices for improved readability and optimization
    unsigned index = threadIdx.x + (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x;
    
    if (index < num_keys) {
        data[index] = index;
    }
}