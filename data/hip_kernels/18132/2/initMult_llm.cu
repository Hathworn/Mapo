#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initMult(uint32_t *A, uint32_t size, uint32_t mult) {
    uint32_t id = blockIdx.x * blockDim.x + threadIdx.x;
    uint32_t stride = blockDim.x * gridDim.x; // Calculate the stride for loop unrolling
    for (uint32_t i = id; i < size; i += stride) {
        A[i] = i * mult; // Unroll kernel to handle multiple elements per thread
    }
}