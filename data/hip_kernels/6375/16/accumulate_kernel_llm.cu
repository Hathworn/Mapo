#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate unique thread index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Use a register for local accumulation
    float local_sum = 0.0f;
    
    // Unroll loop partially to increase performance
    int k;
    for (k = 0; k < n; k += 4) {
        if (k < n) local_sum += x[k * groups + i];
        if ((k + 1) < n) local_sum += x[(k + 1) * groups + i];
        if ((k + 2) < n) local_sum += x[(k + 2) * groups + i];
        if ((k + 3) < n) local_sum += x[(k + 3) * groups + i];
    }
    
    // Write accumulated result back to global memory
    sum[i] = local_sum;
}