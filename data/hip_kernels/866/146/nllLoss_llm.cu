#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    // Check if tid is within bounds to prevent out-of-bounds access
    if (tid < gridDim.x * blockDim.x) {
        int offset = tid * x_stride + target[tid];
        y[tid] = -1.0f * x[offset];
    }
}