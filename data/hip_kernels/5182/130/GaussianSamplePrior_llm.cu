```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianSamplePrior(float* input, int inputCount, float* mins, float* maxes, float* randomUniform)
{
    // Calculate unique thread index in grid
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; 

    if (i < inputCount)
    {
        float diff = maxes[i] - mins[i];
        input[i] = randomUniform[i] * diff + mins[i];
    }
}