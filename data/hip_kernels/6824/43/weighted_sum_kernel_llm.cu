#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the index using block and thread values
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate the stride for grid-stride loop

    // Use grid-stride loop to allow the kernel to handle any array size
    for (int idx = i; idx < n; idx += stride) {
        c[idx] = s[idx] * a[idx] + (1 - s[idx]) * (b ? b[idx] : 0);
    }
}