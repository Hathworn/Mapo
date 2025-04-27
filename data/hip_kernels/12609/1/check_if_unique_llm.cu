#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_if_unique(const unsigned *keys, unsigned *is_unique, size_t kSize) {
    unsigned id = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Check if within bounds
    if (id < kSize) {
        if (id == 0) {
            // Initialize first element as unique
            is_unique[0] = 1;
        } else {
            // Set unique flag based on comparison with previous element
            is_unique[id] = (keys[id] != keys[id - 1]);
        }
    }
}