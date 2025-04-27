#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better performance, assuming N is a multiple of 4
    int step = 4;
    for (; i < N; i += blockDim.x * gridDim.x * step) {
        if (i < N) C[i] = A[i] + B[i];
        if (i + 1 < N) C[i + 1] = A[i + 1] + B[i + 1];
        if (i + 2 < N) C[i + 2] = A[i + 2] + B[i + 2];
        if (i + 3 < N) C[i + 3] = A[i + 3] + B[i + 3];
    }
}