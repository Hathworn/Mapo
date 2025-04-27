#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExpKernel_optimized(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    // Calculate a flat index based on 3D grid and block dimensions
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    if (id < out0count)
    {
        // Efficient usage of memory by directly accessing index and computing the exponential
        out0[id] = expf(A[id]);
    }
}