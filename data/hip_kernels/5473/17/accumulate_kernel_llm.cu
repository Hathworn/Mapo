#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit early if index exceeds groups
    if (i >= groups) return;

    float tmp_sum = 0.0f; // Local variable to reduce global memory write
    for (int k = 0; k < n; ++k) {
        tmp_sum += x[k * groups + i];
    }
    sum[i] = tmp_sum;
}