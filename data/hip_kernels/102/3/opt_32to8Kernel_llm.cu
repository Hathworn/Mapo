#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void opt_32to8Kernel(uint32_t *input, uint8_t* output, size_t length) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Check within bounds to avoid out-of-bounds memory access
    if (idx < length) {
        output[idx] = (input[idx] < UINT8_MAX) ? static_cast<uint8_t>(input[idx]) : UINT8_MAX;
    }

    // Remove unnecessary __syncthreads() for this simple assignment operation
}