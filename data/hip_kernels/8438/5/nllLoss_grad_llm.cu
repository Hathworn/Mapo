#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void nllLoss_grad(int x_stride, float *yGrad, int* target, float* xGrad) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure tid is within valid range
    if (tid < gridDim.x * blockDim.x) {
        int offset = tid * x_stride + target[tid];

        // Use atomic operation to prevent race conditions
        atomicAdd(&xGrad[offset], -yGrad[tid]);
    }
}