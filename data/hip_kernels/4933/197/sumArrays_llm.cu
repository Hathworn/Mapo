#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling to process multiple elements per thread
    int stride = blockDim.x * gridDim.x;
    for (; i < N; i += stride)
    {
        C[i] = A[i] + B[i];
        if (i + 1 < N)
            C[i + 1] = A[i + 1] + B[i + 1];
        // Add more unrolling if the GPU can handle more work per thread
    }
}