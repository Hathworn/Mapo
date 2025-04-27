#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    // Calculate global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check boundary condition before accessing memory
    if (tid < x_stride) {
        int offset = tid * x_stride + target[tid];
        
        // Use atomic addition for safe concurrent write
        atomicAdd(&xGrad[offset], -1 * yGrad[tid]);
    }
}