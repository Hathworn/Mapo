#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread ID is within bounds
    if (tid < gridDim.x * blockDim.x) {
        int offset = tid * x_stride + target[tid];
        y[tid] = -x[offset]; // Simplified negative multiplication
    }
}