#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianSamplePrior(float* input, int inputCount, float* mins, float* maxes, float* randomUniform)
{
    // Optimization: Use a 1D grid and 1D block for simpler indexing
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < inputCount)
    {
        float diff = maxes[i] - mins[i];
        input[i] = randomUniform[i] * diff + mins[i];
    }
}