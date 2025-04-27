#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // Use a register to avoid recalculating blockDim.x * 4
    int stride = blockDim.x * 4;
    
    unsigned int k = i + offset;
    
    // Ensure correct bounds checking and unrolling
    if (k + 3 * blockDim.x < n)
    {
        C[k]              = A[i]                 + B[i];
        C[k + blockDim.x] = A[i + blockDim.x]    + B[i + blockDim.x];
        C[k + 2 * blockDim.x] = A[i + 2 * blockDim.x] + B[i + 2 * blockDim.x];
        C[k + 3 * blockDim.x] = A[i + 3 * blockDim.x] + B[i + 3 * blockDim.x];
    }
    else 
    {
        for (int j = 0; j < stride && (k + j < n); j += blockDim.x) 
        {
            C[k + j] = A[i + j] + B[i + j];
        }
    }
}