#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_ramp_kernel(int n, float *x, float *y)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Process elements within bounds only
    if (i < n) {
        y[i] = x[i] * (x[i] > 0) + 0.1f * x[i];
    }
}