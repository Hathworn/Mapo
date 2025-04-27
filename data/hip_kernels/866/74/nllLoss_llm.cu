#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int target_value = target[tid]; // Precompute target index
    int offset = tid * x_stride + target_value; // Use precomputed target index
    y[tid] = -x[offset]; // Simplify multiplication
}