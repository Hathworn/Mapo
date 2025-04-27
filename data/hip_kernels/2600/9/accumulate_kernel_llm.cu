#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Use a temporary variable for accumulation to optimize memory access
    float temp_sum = 0.0f;
    for (int k = 0; k < n; ++k) {
        temp_sum += x[k * groups + i];
    }

    // Store the result in global memory
    sum[i] = temp_sum;
}