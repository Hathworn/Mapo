#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Improved block and shared memory access
    constexpr int kNumShmemElements = 256 / 64;

    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;
    int laneId = threadIdx.x & 0x3F; // Use lane ID for mask/index

    int planeIndex = index >> 6;

    if (planeIndex >= n) return;

    // Load masks and values into shared memory for the whole warp
    if(laneId == 0) {
        shMasks[threadIdx.x >> 6] = masks[planeIndex];
        shVals[threadIdx.x >> 6] = values[planeIndex];
    }
    __syncthreads();

    // Broadcast data from shared memory
    uint64_t mask = shMasks[threadIdx.x >> 6];
    float op = (mask & (1ull << laneId)) ? shVals[threadIdx.x >> 6] : 0;

    output[index] = op;
}