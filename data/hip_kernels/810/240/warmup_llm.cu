#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;
    
    // Use memory coalescing by ensuring data access patterns are aligned
    if (k < n) 
    {
        C[k] = A[k - offset] + B[k - offset];
    }
}