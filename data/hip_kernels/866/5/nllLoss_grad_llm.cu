#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if tid is within bounds to prevent out-of-bounds access
    if (tid < gridDim.x * blockDim.x) {
        int offset = tid * x_stride + target[tid];
        atomicAdd(&xGrad[offset], -1.0f * yGrad[tid]); // Use atomicAdd for thread safety
    }
}