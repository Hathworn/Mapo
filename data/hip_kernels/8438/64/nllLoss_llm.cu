#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid < gridDim.x * blockDim.x) {  // Boundary check
        int offset = tid * x_stride + target[tid];
        y[tid] = -x[offset];  // Simplified multiplication
    }
}