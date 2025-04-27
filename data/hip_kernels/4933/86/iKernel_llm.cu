#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    // Use a loop to ensure all elements are processed even if N is not a multiple of blockDim.x
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x)
    {
        C[i] = A[i] + B[i];
    }
}