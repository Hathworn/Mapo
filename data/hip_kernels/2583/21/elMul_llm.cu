#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elMul(int N, int M, float *X1, float *X2)
{
    // Efficiently compute global thread index using built-in variables
    int index = blockIdx.y * blockDim.y * N + blockIdx.x * blockDim.x + threadIdx.y * N + threadIdx.x;

    // Check if index is within bounds and perform multiplication
    if (index < N * M)
    {
        X1[index] = __fmul_rn(X1[index], X2[index]); // Use fast multiply operation
    }
}