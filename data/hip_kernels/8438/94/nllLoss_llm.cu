#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    // Precompute tid and offset only when it's within range
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < gridDim.x * blockDim.x) {
        int offset = tid * x_stride + target[tid];
        y[tid] = -x[offset]; // Use direct multiplication for -1
    }
}