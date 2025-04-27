#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global index
    c[index] = a[index] + b[index]; // Use global index
}