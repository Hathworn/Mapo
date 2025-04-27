#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Compute a unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize sum to 0
    float local_sum = 0.0f;

    // Accumulate values for each group in a local variable
    for (int k = 0; k < n; ++k) {
        local_sum += x[k * groups + i];
    }

    // Write the local sum to global memory
    sum[i] = local_sum;
}