#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Compute unique index for each thread
    if (i >= groups) return;  // Early exit for threads beyond the range

    float local_sum = 0.0f;  // Use a local variable to store sum
    for (int k = 0; k < n; ++k) {
        local_sum += x[k * groups + i];  // Accumulate values from global memory
    }
    sum[i] = local_sum;  // Write the computed sum to global memory
}