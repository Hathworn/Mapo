#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bcnn_op_cuda_tanh_grad_kernel(int n, float *x, float *dx) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation
    if (i < n) {
        float val = x[i];  // Cache x[i] to reduce memory access
        dx[i] *= (1 - val * val);  // Utilize cached value
    }
}