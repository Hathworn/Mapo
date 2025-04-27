#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global thread index for potential larger grid sizes
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure boundary check to avoid accessing out-of-bounds memory
    if (i < N) // Assuming N is defined as the total number of elements
    {
        c[i] = a[i] + b[i];
    }
}