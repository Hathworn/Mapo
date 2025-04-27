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

    // Load inputs to shared memory only if necessary.
    // Optimize memory access patterns.
    int shIndex = threadIdx.x >> 6;
    if (threadIdx.x < kNumShmemElements * 64) {
        if (threadIdx.x < kNumShmemElements) {
            shMasks[threadIdx.x] = masks[planeIndex + threadIdx.x];
            shVals[threadIdx.x] = values[planeIndex + threadIdx.x];
        }
        __syncthreads();

        uint64_t mask = shMasks[shIndex];
        int sqIndex = index & 0x3F;
        
        // Utilize registers for temporary variables
        float op = (mask & (1ull << sqIndex)) ? shVals[shIndex] : 0.0f;
        output[index] = op;
    }
}