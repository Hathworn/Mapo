#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expandPlanes_kernel_Fp32_NCHW(float* output, const uint64_t* masks, const float* values, int n) {
    // Define constants for better clarity
    constexpr int kThreadsPerPlane = 64;
    constexpr int kNumShmemElements = 4; // 256 / 64

    __shared__ uint64_t shMasks[kNumShmemElements];
    __shared__ float shVals[kNumShmemElements];

    int index = threadIdx.x + blockDim.x * blockIdx.x;
    int planeIndex = index >> 6;

    if (planeIndex >= n) return;

    // Load inputs to shared memory - each shmem element handles 64 threads
    if (threadIdx.x < kNumShmemElements) {
        shMasks[threadIdx.x] = masks[planeIndex + threadIdx.x];
        shVals[threadIdx.x] = values[planeIndex + threadIdx.x];
    }
    __syncthreads();

    // Load the mask and value for the current thread's segment
    int shmemIndex = threadIdx.x >> 6;
    uint64_t mask = shMasks[shmemIndex];
    float op = 0;

    // Determine if the output at this index should be set
    bool set = mask & (1ull << (index & 0x3F));
    if (set) {
        op = shVals[shmemIndex];
    }

    output[index] = op;
}