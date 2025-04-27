#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < x_stride) {  // Ensure threads don't exceed array bounds
        int offset = tid * x_stride + target[tid];
        xGrad[offset] -= yGrad[tid]; // Use compound assignment for simplicity
    }
}