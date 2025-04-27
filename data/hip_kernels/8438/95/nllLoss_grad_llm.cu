#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    // Use shared memory to cache frequently accessed data
    extern __shared__ int sharedTarget[]; 
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (threadIdx.x < x_stride) {
        sharedTarget[threadIdx.x] = target[tid];
    }
    __syncthreads();
    
    int offset = tid * x_stride + sharedTarget[threadIdx.x];
    atomicAdd(&xGrad[offset], -yGrad[tid]);  // Atomic operation to ensure correct updates
}