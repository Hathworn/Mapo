```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Combine index computation and boundary check
    if (i + offset < n) {
        // Precompute the offset index
        unsigned int k = i + offset;
        C[i] = A[k] + B[k];
    }
}