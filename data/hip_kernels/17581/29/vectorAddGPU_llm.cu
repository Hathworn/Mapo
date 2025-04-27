#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddGPU(float *a, float *b, float *c, int N)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within bounds
    if (idx < N) 
    {
        // Perform vector addition directly
        c[idx] = a[idx] + b[idx];
    }
}