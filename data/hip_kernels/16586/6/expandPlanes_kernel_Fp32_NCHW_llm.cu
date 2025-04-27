#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Block size of 256, same mask/val for 64 consecutive threads.
    constexpr int kNumShmemElements = 256 / 64;

    // Use shared memory to reduce global memory access.
    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;

    int planeIndex = index >> 6;

    if (planeIndex >= n) return;

    // Load inputs to shared memory with coalesced access pattern.
    if (threadIdx.x < kNumShmemElements) {
        shMasks[threadIdx.x] = masks[planeIndex + threadIdx.x];
        shVals[threadIdx.x] = values[planeIndex + threadIdx.x];
    }
    __syncthreads();

    // Directly calculate the mask and value using optimized operations.
    uint64_t mask = shMasks[planeIndex % kNumShmemElements];

    // Calculate local index within the block.
    int sqIndex = index & 0x3F;
    float op = 0;

    // Check if the bit is set and load corresponding value.
    if (mask & (1ull << sqIndex)) {
        op = shVals[planeIndex % kNumShmemElements];
    }
    output[index] = op;
}