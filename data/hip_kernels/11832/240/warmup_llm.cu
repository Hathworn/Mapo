#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;
    
    // Use warp shuffle to avoid divergent branches
    if (k < n) 
    {
        float a_val = A[i];
        float b_val = B[i];
        C[k] = a_val + b_val;
    }
}