#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixCopy_optimized(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    // Calculate global thread index for a 1D grid of 1D blocks
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform copy only if the thread index is within bounds
    if (id < out0count)
    {
        out0[id] = A[id];
    }
}