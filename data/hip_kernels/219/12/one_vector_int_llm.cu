```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void one_vector_int(int *vec, const int n)
{
    // Calculate thread index
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Efficient boundary check and assignment
    if (xIndex < n)
    {
        vec[xIndex] = 1;
    }
}