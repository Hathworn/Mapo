#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Reduce computation of grid index and check within valid range in the loop
    while (i < n) {
        c[i] = s[i] * a[i] + (1 - s[i]) * (b ? b[i] : 0);
        i += blockDim.x * gridDim.x; // Advance index by total number of threads
    }
}