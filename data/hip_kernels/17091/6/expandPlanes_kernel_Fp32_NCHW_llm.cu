#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Block size of 256, same mask/val for 64 consecutive threads.
    constexpr int kNumShmemElements = 256 / 64;

    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;
    int planeIndex = index >> 6;

    // Exit if index is out of bounds
    if (planeIndex >= n) return;

    // Load inputs to shared memory only with necessary threads
    if (threadIdx.x < 64) {
        int shIndex = threadIdx.x >> 6;
        shMasks[shIndex] = masks[planeIndex + shIndex];
        shVals[shIndex] = values[planeIndex + shIndex];
    }
    __syncthreads();

    // Read mask and value from shared memory
    uint64_t mask = shMasks[threadIdx.x >> 6];
    float op = shVals[threadIdx.x >> 6];

    // Compute output based on mask
    output[index] = (mask & (1ull << (index & 0x3F))) ? op : 0.0f;
}
```
