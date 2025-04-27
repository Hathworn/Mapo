#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardDifferenceAdjointKernel(const int len, const float* source, float* target) {
    // Use shared memory for better memory access patterns
    __shared__ float sharedSource[1024];
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 1;

    if (idx < len - 1) {
        sharedSource[threadIdx.x] = source[idx - 1];
        __syncthreads();

        // Avoids extra out-of-bound checks and utilizes shared memory
        target[idx] = -source[idx] + sharedSource[threadIdx.x];
    }
}