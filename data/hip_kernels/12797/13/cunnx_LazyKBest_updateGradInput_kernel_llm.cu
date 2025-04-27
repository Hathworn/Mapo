#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_LazyKBest_updateGradInput_kernel(float *gradInput, const float *indice, const float *gradOutput, int inputSize, int outputSize)
{
    int tx = threadIdx.x + blockIdx.x * blockDim.x;  // Use unique global thread index
    int step = blockDim.x * gridDim.x;               // Adjust step for all blocks

    float *gradInput_k = gradInput + blockIdx.x * inputSize;
    const float *gradOutput_k = gradOutput + blockIdx.x * outputSize;
    const float *indice_k = indice + blockIdx.x * outputSize;

    for (int i = tx; i < outputSize; i += step)
    {
        int index = static_cast<int>(indice_k[i] - 1); // Cache index for reuse
        gradInput_k[index] = gradOutput_k[i];
    }
}