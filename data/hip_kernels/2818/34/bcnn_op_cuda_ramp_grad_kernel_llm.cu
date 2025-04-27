```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_ramp_grad_kernel(int n, float *x, float *dx) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index computation
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    
    while (i < n) { // Use loop for processing more elements within one thread
        dx[i] *= ((float)(x[i] > 0) + 0.1f);
        i += stride;
    }
}