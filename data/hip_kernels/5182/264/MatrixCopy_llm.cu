#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixCopy(float* in, float* out, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified id calculation by using 1D grid and block index
    if (id < size)
    {
        out[id] = in[id];
    }
}