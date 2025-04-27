#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate the global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use a direct array index check to improve efficiency
    if (i < n - offset) 
    {
        C[i] = A[k] + B[k];
    }
}