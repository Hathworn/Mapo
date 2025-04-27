#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x; // Extend index for block/grid
    int stride = blockDim.x * gridDim.x; // Stride for grid

    // Unroll loop for better performance by using stride
    for (int idx = i; idx < 1024 * 500; idx += stride) {
        c[idx] = a[idx] * 10 + b[idx] * 5;
    }
}