#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the unique thread index
    
    // Check if tid is within bounds to avoid illegal memory access
    if (tid < gridDim.x * blockDim.x) {
        int offset = tid * x_stride + target[tid];   // Compute the offset
        atomicAdd(&xGrad[offset], -yGrad[tid]);      // Use atomicAdd for safe concurrent updates
    }
}