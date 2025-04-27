#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int* c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < N) // Ensure within bounds, assume N is the total number of elements
    {
        c[i] = a[i] + b[i];
    }
}