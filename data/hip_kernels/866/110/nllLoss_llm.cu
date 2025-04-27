```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Assign each thread a corresponding offset
    int offset = tid * x_stride + target[tid];
    // Perform the NLL loss computation with improved readability
    y[tid] = -x[offset];
}