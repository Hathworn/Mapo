#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffsetUnroll2(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;  // Calculate 2 block strides
    unsigned int k = i + offset;

    if (k < n)
    {
        // Load data before use to optimize memory access
        float Ai = A[i];
        float Bi = B[i];
        
        C[k] = Ai + Bi;

        if (i + blockDim.x < n)  // Ensure second write is within bounds
        {
            float Ai1 = A[i + blockDim.x];
            float Bi1 = B[i + blockDim.x];
            C[k + blockDim.x] = Ai1 + Bi1;
        }
    }
}