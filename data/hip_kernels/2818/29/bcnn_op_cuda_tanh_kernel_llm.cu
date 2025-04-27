#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bcnn_op_cuda_tanh_kernel(int n, float *x, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation using 1D grid
    int gridStride = gridDim.x * blockDim.x; // Compute stride for grid-wide loop
    for (; i < n; i += gridStride) { // Use grid stride loop for better parallelization
        float exp_val = expf(2 * x[i]); // Compute exp once to optimize performance
        y[i] = (exp_val - 1) / (exp_val + 1);
    }
}