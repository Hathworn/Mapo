#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c, int n)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within array bounds
    if (index >= n) return;

    // Perform the addition
    c[index] = a[index] + b[index];
}