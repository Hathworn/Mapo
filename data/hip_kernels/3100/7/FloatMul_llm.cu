#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FloatMul(float *A, float *B, float *C)
{
    // Calculate the global thread index directly
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Efficiently multiply arrays A and B
    C[i] = A[i] * B[i];
}