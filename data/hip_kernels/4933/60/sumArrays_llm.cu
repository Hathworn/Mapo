#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop to improve performance
    if (i < N) {
        C[i] = A[i] + B[i];
        if (i + blockDim.x < N) C[i + blockDim.x] = A[i + blockDim.x] + B[i + blockDim.x];
        if (i + 2 * blockDim.x < N) C[i + 2 * blockDim.x] = A[i + 2 * blockDim.x] + B[i + 2 * blockDim.x];
        if (i + 3 * blockDim.x < N) C[i + 3 * blockDim.x] = A[i + 3 * blockDim.x] + B[i + 3 * blockDim.x];
    }
}