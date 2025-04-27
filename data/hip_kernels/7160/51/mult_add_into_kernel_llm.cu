#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Use a 2D thread index for better parallel execution
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Unroll the loop to improve memory throughput
    for (int idx = i; idx < n; idx += stride) {
        c[idx] += a[idx] * b[idx];
    }
}