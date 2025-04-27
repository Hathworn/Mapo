#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Block size of 256, optimized by reducing divergent branching and improving shared memory access.
    constexpr int kNumShmemElements = 4; // Matches the number of mask/val pairs

    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;

    int planeIndex = index >> 6;

    if (planeIndex >= n) return;

    // Each warp of 64 threads collectively loads one mask/val pair to shared memory.
    if (threadIdx.x < 64) {
        if (threadIdx.x < kNumShmemElements) {
            shMasks[threadIdx.x] = masks[planeIndex + threadIdx.x];
            shVals[threadIdx.x] = values[planeIndex + threadIdx.x];
        }
    }
    __syncthreads();

    uint64_t mask = shMasks[planeIndex & (kNumShmemElements - 1)];
    float val = shVals[planeIndex & (kNumShmemElements - 1)];

    int sqIndex = index & 0x3F;
    output[index] = (mask & (1ull << sqIndex)) ? val : 0;
}