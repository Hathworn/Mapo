#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_hadamard(float *a, float *b, float *c, int rows, int columns)
{
    int k = blockDim.x * blockIdx.x + threadIdx.x; // Flatten the 2D grid and block into 1D index

    if (k < rows * columns) // Use the 1D index to check bounds
    {
        c[k] = a[k] * b[k]; // Perform element-wise multiplication
    }
}