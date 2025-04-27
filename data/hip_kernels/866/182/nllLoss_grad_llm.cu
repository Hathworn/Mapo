#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Calculate offset conditionally to avoid out-of-bounds access
    if (tid < x_stride) {
        int offset = tid * x_stride + target[tid];
        // Utilize atomic addition to avoid race conditions if needed
        atomicAdd(&xGrad[offset], -1 * yGrad[tid]);
    }
}