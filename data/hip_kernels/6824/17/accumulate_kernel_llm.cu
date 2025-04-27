#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate the global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Return if the index is out of bounds
    if (i >= groups) return;

    // Initialize sum for the ith group
    float local_sum = 0.0f;

    // Use shared memory for partial reduction if necessary
    extern __shared__ float shared[];

    // Iterate over n elements and accumulate the sum
    for (int k = 0; k < n; ++k)
    {
        local_sum += x[k * groups + i];
    }

    // Store the local sum in the output array
    sum[i] = local_sum;
}