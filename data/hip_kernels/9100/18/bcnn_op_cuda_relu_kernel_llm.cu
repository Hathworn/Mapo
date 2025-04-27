```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_relu_kernel(int n, float *x, float *y)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Improve efficiency by unrolling the loop
    for (; i < n; i += gridDim.x * blockDim.x) {
        y[i] = x[i] * (x[i] > 0);
    }
}