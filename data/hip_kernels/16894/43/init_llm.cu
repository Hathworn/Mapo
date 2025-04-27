#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    // Compute global thread index
    auto i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single thread to print once
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("init\n");
    }

    // Initialize array elements; avoid branching
    if (i < n) {
        v[i] = val;
    }
}