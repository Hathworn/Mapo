#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    // Calculate the thread's unique global index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate offset based on unique index and target value
    int offset = tid * x_stride + target[tid];

    // Efficient negative multiplication
    y[tid] = -x[offset];
}