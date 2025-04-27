#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    // Use local variable for thread index calculation
    uint32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        v[i] = val;
    }
    // Reduce conditional divergence by placing printf after initialization
    if (i == 0) {
        printf("init\n");
    }
}