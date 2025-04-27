#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for improved performance
    if (i < N) {
        C[i] = A[i] + B[i];
    }
    i += blockDim.x * gridDim.x;
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}