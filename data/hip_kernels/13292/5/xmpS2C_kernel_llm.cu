#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xmpS2C_kernel(uint32_t N, uint32_t limbs, uint32_t stride, const uint32_t * in, uint32_t * out) {
    // Calculate thread's global index in x and y dimensions
    uint32_t global_idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    uint32_t global_idx_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimize thread loop by checking boundary conditions upfront
    if(global_idx_x < limbs && global_idx_y < N) {
        // Write coalesced in outer dimension
        out[global_idx_y * limbs + global_idx_x] = in[global_idx_x * stride + global_idx_y];
    }
}