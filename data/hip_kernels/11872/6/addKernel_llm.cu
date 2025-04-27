#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform vector addition
    if (i < N) // Ensure within array bounds assuming N is defined
    {
        c[i] = a[i] + b[i];
    }
}