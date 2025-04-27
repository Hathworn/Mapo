#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_relu_grad_kernel(int n, float *x, float *dx)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation, remove unnecessary blockIdx.y and gridDim.x
    if (i < n) {
        dx[i] *= (x[i] > 0.0f); // Remove cast by using floating-point literal
    }
}