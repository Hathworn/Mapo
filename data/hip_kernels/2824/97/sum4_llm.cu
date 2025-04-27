#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum4(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize the loop by reducing extraneous increment operations
    #pragma unroll
    for (int j = 0; j < 4; j++)
    {
        int idx = i + j * blockDim.x * gridDim.x;
        if (idx < N) {
            C[idx] = A[idx] + B[idx];
        }
    }
}