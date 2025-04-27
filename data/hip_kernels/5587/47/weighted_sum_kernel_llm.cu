#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better GPU utilization
    for(int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        // Perform the weighted sum computation
        c[idx] = s[idx] * a[idx] + (1 - s[idx]) * (b ? b[idx] : 0);
    }
}