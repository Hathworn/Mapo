#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_if_unique(const unsigned *keys, unsigned *is_unique, size_t kSize) {
    unsigned id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize first element uniquely
    if (id == 0) {
        is_unique[0] = 1;
    } 
    // Check bounds and uniqueness for other elements
    else if (id < kSize) {
        is_unique[id] = (keys[id] != keys[id - 1]);
    }
}