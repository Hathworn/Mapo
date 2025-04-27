#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    // Use register for faster access
    uint32_t i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling the loop
    uint32_t gridStride = blockDim.x * gridDim.x; 
    for (uint32_t idx = i; idx < n; idx += gridStride) {
        v[idx] = val;
    }

    // Print only once per grid, using blockIdx and threadIdx
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        printf("init\n");
    }
}