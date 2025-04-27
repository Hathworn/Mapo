#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float logit1(const float x) {
    return expf(x) / (1.0f + expf(x));
}

__global__ void logit(float* y, const float* x, int leng) {
    // Calculate global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to handle out-of-bounds access
    int stride = blockDim.x * gridDim.x;
    for (; i < leng; i += stride) {
        y[i] = logit1(x[i]);
    }
}