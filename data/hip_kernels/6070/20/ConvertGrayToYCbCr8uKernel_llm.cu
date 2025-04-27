#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ConvertGrayToYCbCr8uKernel(const uint8_t *input, uint8_t *output, unsigned int total_pixels) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= total_pixels) {
        return;
    }

    /* Use `C` macro instead of hardcoding and precompute index */
    #define C 3
    unsigned int out_idx = idx * C;
    
    const uint8_t pixel_in = input[idx];
    output[out_idx] = pixel_in;
    output[out_idx + 1] = 128;
    output[out_idx + 2] = 128;
}