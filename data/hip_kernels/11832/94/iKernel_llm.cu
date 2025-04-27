#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use collective memory access for better performance
    if (i < N)
    {
        const float a = __ldg(&A[i]);
        const float b = __ldg(&B[i]);
        C[i] = a + b;
    }
}