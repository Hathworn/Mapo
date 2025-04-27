#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixCopy_naive(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID calculation
    if (id < out0count)
    {
        out0[id] = A[id];
    }
}