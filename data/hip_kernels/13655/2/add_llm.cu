#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int a, int b, int *c)
{
    // Efficiently compute the sum in parallel
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) // Ensure only one thread writes the result
    {
        *c = a + b;
    }
}