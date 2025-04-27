#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xmpC2S_kernel(uint32_t N, uint32_t limbs, uint32_t stride, const uint32_t * in, uint32_t * out) {
    // Calculate the unique thread index within the grid
    uint32_t globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    uint32_t globalIdy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads remain within valid range
    if (globalIdx < N && globalIdy < limbs) {
        // Optimize memory access to improve coalescing
        out[globalIdy * stride + globalIdx] = in[globalIdx * limbs + globalIdy];
    }
}