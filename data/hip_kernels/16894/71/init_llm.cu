#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    // Calculate global thread index
    uint32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within bounds and initialize value
    if (i < n) {   
        v[i] = val;
    }
    
    // Ensure printf is executed by only one thread
    if (i == 0) {
        printf("init\n");
    }
}