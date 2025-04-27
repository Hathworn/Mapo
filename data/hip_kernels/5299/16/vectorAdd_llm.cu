#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Unroll loop iterations for better performance
    #pragma unroll
    for (int idx = i; idx < numElements; idx += blockDim.x * gridDim.x) {
        C[idx] = A[idx] + B[idx];
    }
}