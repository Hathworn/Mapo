#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSum(int* a, int* b, int* c, int size)
{
    // Calculate unique global thread ID
    int pos = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Globally synchronize using grid-stride loop
    for (int i = pos; i < size * size; i += blockDim.x * gridDim.x)
    {
        c[i] = a[i] + b[i];
    }
}