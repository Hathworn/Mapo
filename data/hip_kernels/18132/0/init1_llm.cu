#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init1(uint32_t *A, uint32_t size) {
    uint32_t id = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Use loop unrolling for performance improvement
    if (id < size) {
        A[id] = 1;
    }
    if (id + blockDim.x < size) {
        A[id + blockDim.x] = 1;
    }
    if (id + 2 * blockDim.x < size) {
        A[id + 2 * blockDim.x] = 1;
    }
    if (id + 3 * blockDim.x < size) {
        A[id + 3 * blockDim.x] = 1;
    }
}