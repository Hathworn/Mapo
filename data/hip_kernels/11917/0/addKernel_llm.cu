#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use global thread index for larger arrays
    if (i < N) // Guard against out-of-bounds access assuming size N is defined
    {
        c[i] = a[i] + b[i];
    }
}