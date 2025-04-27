#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Calculate the global offset once
    int offset = tid * x_stride + target[tid];

    // Perform operation using memory coalescing
    y[tid] = -x[offset];
}