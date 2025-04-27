#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the linear index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a multiple of blockDim.x * gridDim.x for larger grids
    // Allow more threads or smaller grid size in case 'n' is small
    int total_threads = blockDim.x * gridDim.x;

    // Use a loop for processing multiple elements per thread
    for (; i < n; i += total_threads) {
        c[i] = s[i] * a[i] + (1 - s[i]) * (b ? b[i] : 0);
    }
}