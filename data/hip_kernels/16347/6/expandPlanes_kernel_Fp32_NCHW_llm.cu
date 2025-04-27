#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Block size of 256, same mask/val for 64 consecutive threads.
    constexpr int kNumShmemElements = 256 / 64;

    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;
    int planeIndex = index >> 6;

    if (planeIndex >= n) return;

    // Load inputs to shared memory using fewer branches.
    if (threadIdx.x < kNumShmemElements) {
        int sharedIdx = threadIdx.x;
        shMasks[sharedIdx] = masks[planeIndex + sharedIdx];
        shVals[sharedIdx] = values[planeIndex + sharedIdx];
    }
    __syncthreads();

    uint64_t mask = shMasks[threadIdx.x >> 6];
    int sqIndex = index & 0x3F;
    float op = 0;

    // Use conditional assignment to avoid branches.
    op = (mask & (1ull << sqIndex)) ? shVals[threadIdx.x >> 6] : 0;
    output[index] = op;
}