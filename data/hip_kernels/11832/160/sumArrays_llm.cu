#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    // Calculate thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index bounds
    if (idx < N)
    {
        // Sum arrays element-wise
        C[idx] = A[idx] + B[idx];
    }
}