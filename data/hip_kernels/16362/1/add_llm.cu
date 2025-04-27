#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *a, float *b, float *sum)
{
    // Use a variable instead of repeatedly fetching it
    int totalThreads = blockDim.x * gridDim.x;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += totalThreads)
    {
        sum[i] = a[i] + b[i]; // Perform addition in coalesced memory access pattern
    }
}