#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    // Use shared memory for efficiency if applicable
    extern __shared__ float shared_yGrad[];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (tid < x_stride) {
        shared_yGrad[threadIdx.x] = yGrad[tid];
        __syncthreads(); // Ensure all threads have loaded yGrad
        
        int offset = tid * x_stride + target[tid];
        // Perform atomic operation to avoid race conditions
        atomicAdd(&xGrad[offset], -shared_yGrad[threadIdx.x]);
    }
}