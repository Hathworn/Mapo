#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_if_unique(const unsigned *keys, unsigned *is_unique, size_t kSize) {
    unsigned id = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;
    if (id < kSize) {
        // Simplified condition to initiate the uniqueness check
        is_unique[id] = (id == 0 || keys[id] != keys[id - 1]) ? 1 : 0;
    }
}