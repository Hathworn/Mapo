#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BackwardSigmoid(float* Z, float* dA, int nRowsdZ, int nColsdZ, float *dZ)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < nRowsdZ * nColsdZ)
    {
        // Precompute sigmoid to avoid redundant computation
        float sigmoid = 1 / (1 + expf(-Z[index]));
        dZ[index] = sigmoid * (1 - sigmoid) * dA[index];
    }
}