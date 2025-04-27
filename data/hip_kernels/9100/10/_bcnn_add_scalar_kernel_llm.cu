#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_add_scalar_kernel(int n, float a, float *y)
{
    // Use stride to cover all elements for better parallelism
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride) {
        y[i] += a;
    }
}