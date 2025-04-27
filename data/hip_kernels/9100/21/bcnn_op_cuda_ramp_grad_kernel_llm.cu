#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bcnn_op_cuda_ramp_grad_kernel(int n, float *x, float *dx)
{
    // Calculate the global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Improved bounds checking
    if (i < n) {
        // Use bool-to-float conversion
        dx[i] *= ((x[i] > 0.0f) + 0.1f);
    }
}