#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_if_unique(const unsigned *keys, unsigned *is_unique, size_t kSize) {
    unsigned id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified the ID calculation
    if (id < kSize) { // Combined condition to check all within bounds
        is_unique[id] = (id == 0 || keys[id] != keys[id - 1]) ? 1 : 0; // Optimized indexing and unified condition
    }
}