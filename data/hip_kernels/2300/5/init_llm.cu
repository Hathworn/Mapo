#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    // Calculate global thread index
    auto i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check boundary condition out of loop for increased efficiency
    if (i < n) {
        v[i] = val;
    }
    // Use a single thread to print, reducing unnecessary checks
    if (i == 0) {
        printf("init\n");
    }
}