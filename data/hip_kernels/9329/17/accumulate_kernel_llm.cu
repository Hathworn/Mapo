#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate global thread index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize sum to zero using local variable
    float temp_sum = 0.0f;

    // Iterate over elements with stride based on groups
    for(int k = 0; k < n; ++k) {
        temp_sum += x[k * groups + i];
    }

    // Write result back to global memory
    sum[i] = temp_sum;
}