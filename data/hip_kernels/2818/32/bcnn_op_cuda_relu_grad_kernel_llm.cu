#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_relu_grad_kernel(int n, float *x, float *dx) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified the thread index calculation for 1D grid
    if (i < n) {
        dx[i] *= (x[i] > 0.0f ? 1.0f : 0.0f);  // Inline condition check to make the operation more explicit
    }
}