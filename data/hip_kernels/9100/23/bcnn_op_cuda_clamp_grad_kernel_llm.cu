#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_clamp_grad_kernel(int n, float *x, float *dx)
{
    // Use blockDim.x and gridDim.x to calculate threadIndex for 1D block
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over all elements with a stride to support large arrays
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Optimize conditional operation with ternary operator
        dx[i] *= (x[i] > 0.0f && x[i] < 1.0f) ? 1.0f : 0.0f;
    }
}