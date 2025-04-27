#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(float *g_data, int n)
{
    __shared__ float partialSum[NUM_ELEMENTS];
    unsigned int t = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + t;  // Calculate the global index
    if (idx < n) partialSum[t] = g_data[idx]; // Load only if index is within array bounds
    else partialSum[t] = 0.0f;  // Initialize to zero if out of bounds
    __syncthreads();

    for (int i = blockDim.x / 2; i > 0; i >>= 1)
    {
        if (t < i && idx + i < n)  // Ensure access is within bounds
        {
            partialSum[t] += partialSum[t + i];
        }
        __syncthreads();
    }
    if (t == 0)
    {
        g_data[blockIdx.x] = partialSum[0];  // Store the result in the block's starting location
    }
}