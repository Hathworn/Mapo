#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    float temp_sum = 0.0f; // Use a local variable for accumulation
    for (int k = 0; k < n; ++k){
        temp_sum += x[k * groups + i];
    }
    sum[i] = temp_sum; // Write the result back to global memory
}