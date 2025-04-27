```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void downSampleKernel(unsigned char * d_in, unsigned char * d_out, size_t skip) {
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x; // Global index calculation
    size_t offset = idx * skip * 3; // Compute offset once

    // Bounds check to prevent out-of-bounds access
    if (offset + 2 < skip * gridDim.x * blockDim.x * 3) {
        int px = d_in[offset] + d_in[offset + 1] + d_in[offset + 2]; // Use computed offset
        d_out[idx] = px / 3; // Store averaged value
    }
}