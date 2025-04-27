#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDoEigen(double* m, int rows, int columns)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    if (idx < 4) // Ensure within bounds
    {
        printf("CUDA ptr: %p\n", m + idx);
        printf("CUDA value: %lf\n", m[idx]);
    }
}