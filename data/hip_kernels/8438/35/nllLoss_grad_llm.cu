#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread ID
    int offset = tid * x_stride + target[tid];        // Calculate unique offset for each thread
    atomicAdd(&xGrad[offset], -yGrad[tid]);           // Use atomic addition to prevent race conditions
}