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

    // Load inputs to shared memory efficiently.
    if (threadIdx.x < kNumShmemElements) {
        shMasks[threadIdx.x] = masks[planeIndex + threadIdx.x];
        shVals[threadIdx.x] = values[planeIndex + threadIdx.x];
    }
    __syncthreads();

    // Efficient mask and computation.
    uint64_t mask = shMasks[planeIndex];  // Use correct index for shared memory
    int sqIndex = index & 0x3F;
    float op = 0;

    bool set = !!(mask & (1ull << sqIndex));
    if (set) {
        op = shVals[planeIndex];  // Use correct index for shared memory
    }
    output[index] = op;
}