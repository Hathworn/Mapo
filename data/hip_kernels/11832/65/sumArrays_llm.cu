#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use if statement to check boundary, unnecessary calculations avoided
    if (i < N) 
    {
        C[i] = A[i] + B[i];
    }
}