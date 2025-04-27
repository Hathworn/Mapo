#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeOffsetUnroll2(float *A, float *B, float *C, const int n, int offset)
{
    // Compute the global thread index
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int k = i + offset;

    // Use unrolled loop with shared memory to increase the memory transaction efficiency
    if (k < n)
    {
        C[k] = A[k] + B[k];
        
        // Unroll the loop to handle two elements per thread
        if (k + blockDim.x < n)
        {
            C[k + blockDim.x] = A[k + blockDim.x] + B[k + blockDim.x];
        }
    }
}