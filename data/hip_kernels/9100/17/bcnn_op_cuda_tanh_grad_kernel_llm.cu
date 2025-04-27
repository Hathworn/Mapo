#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_tanh_grad_kernel(int n, float *x, float *dx)
{
    // Use parallel computation by each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride) {
        dx[i] *= (1 - x[i] * x[i]);
    }
}