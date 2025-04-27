#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Calculate memory offset and update gradient if within range
    if (tid < gridDim.x * blockDim.x) {
        int offset = tid * x_stride + target[tid];
        atomicAdd(&xGrad[offset], -yGrad[tid]);  // Use atomic operation for safe updates
    }
}