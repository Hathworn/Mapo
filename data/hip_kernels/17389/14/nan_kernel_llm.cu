#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nan_kernel(float* data, const bool* mask, int len, float nan) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Use warp divergence minimization by iterating over all threads in a block
    for (int i = tid; i < len; i += blockDim.x * gridDim.x) {
        if (!mask[i]) data[i] = nan;
    }
}