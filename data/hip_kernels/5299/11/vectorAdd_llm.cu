```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const double *A, const double *B, double *C, int numElements)
{
    // Cache thread index and global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Perform addition if within bounds, removing unnecessary debugging
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}