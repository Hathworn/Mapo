#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addVectors(float *d_A, float *d_B, float *d_C, int size)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Use a loop to process multiple elements per thread to optimize memory access
    int stride = blockDim.x * gridDim.x;
    for (; i < size; i += stride)
    {
        d_C[i] = d_A[i] + d_B[i];
    }
}