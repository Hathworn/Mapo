#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Improved parallelism by adjusting shared memory loading and mask indexing
    constexpr int kNumThreads = 256;
    constexpr int kNumShmemElements = kNumThreads / 64;

    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;
    int planeIndex = index >> 6;

    if (planeIndex >= n) return;

    // Load masks and values for each 64-thread segment efficiently
    int shmemIndex = threadIdx.x >> 6; // Calculate shared memory index
    if (shmemIndex < kNumShmemElements && threadIdx.x % 64 == 0) {
        shMasks[shmemIndex] = masks[planeIndex + shmemIndex];
        shVals[shmemIndex] = values[planeIndex + shmemIndex];
    }
    __syncthreads();

    uint64_t mask = shMasks[shmemIndex];
    float op = (mask & (1ull << (index & 0x3F))) ? shVals[shmemIndex] : 0.0f;

    output[index] = op;
}