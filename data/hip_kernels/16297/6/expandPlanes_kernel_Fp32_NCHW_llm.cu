#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Use shared memory to reduce global memory accesses, improving performance.
    constexpr int kNumShmemElements = 256 / 64;

    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;

    // Using bitwise shift for better performance in calculating planeIndex.
    int planeIndex = index >> 6;

    if (planeIndex >= n) return;

    // Use static_cast to ensure type correctness in accessing shared memory
    if (threadIdx.x < kNumShmemElements) {
        shMasks[threadIdx.x] = masks[planeIndex + threadIdx.x];
        shVals[threadIdx.x] = values[planeIndex + threadIdx.x];
    }
    __syncthreads();

    // Efficient mask and value retrieval from shared memory.
    uint64_t mask = shMasks[planeIndex];
    float val = shVals[planeIndex];

    // Use bitwise operation to determine if bit is set
    if ((mask & (1ull << (index & 0x3F))) != 0) {
        output[index] = val;
    } else {
        output[index] = 0;
    }
}