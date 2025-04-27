#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_tanh_kernel(int n, float *x, float *y)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure calculations only performed within valid index range
    while (i < n) {
        y[i] = (exp(2 * x[i]) - 1) / (exp(2 * x[i]) + 1);
        i += gridDim.x * blockDim.x; // Utilize grid stride loop for parallelism improvement
    }
}