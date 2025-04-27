#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Execute loop conditionally to eliminate unnecessary iterations
    if (idx < N)
    {
        // Perform the addition operation directly for this index
        C[idx] = A[idx] + B[idx];
    }
}