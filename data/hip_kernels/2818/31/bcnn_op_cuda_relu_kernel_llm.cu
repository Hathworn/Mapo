#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bcnn_op_cuda_relu_kernel(int n, float *x, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (i < n) {
        y[i] = fmaxf(x[i], 0.0f);  // Use fmaxf for better performance
    }
}