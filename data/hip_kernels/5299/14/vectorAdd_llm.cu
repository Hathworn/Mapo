```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Pre-calculate offset for the current thread
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use condition to directly calculate if within bounds
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}