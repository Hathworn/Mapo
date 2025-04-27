#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    // Calculate global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Early exit if tid exceeds dataset
    if (tid >= gridDim.x * blockDim.x) return;

    // Compute the offset and perform gradient update
    int offset = tid * x_stride + target[tid];
    atomicAdd(&xGrad[offset], -yGrad[tid]); // Use atomic operation to avoid race conditions
}