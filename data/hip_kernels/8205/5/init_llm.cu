#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    // Calculate the global thread index
    uint32_t i = blockIdx.x * blockDim.x + threadIdx.x;

    // Assign 'val' to v[i] only if i is within bounds
    if (i < n) {
        v[i] = val;
    }

    // Use thread 0 of block 0 to print "init" once
    if (i == 0 && threadIdx.x == 0) {
        printf("init\n");
    }
}