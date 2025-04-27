#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initn(uint32_t *A, uint32_t size, uint32_t n) {
    uint32_t id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling for better parallelism
    for (uint32_t offset = 0; id + offset < size; offset += blockDim.x * gridDim.x) {
        A[id + offset] = n;
    }
}