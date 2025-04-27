#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunnx_LazyKBest_updateGradInput_kernel(float *gradInput, const float *indice, const float *gradOutput, int inputSize, int outputSize)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index

    if (i < outputSize) // Ensure within bounds
    {
        int k = blockIdx.x;
        float *gradInput_k = gradInput + k * inputSize;
        const float *gradOutput_k = gradOutput + k * outputSize;
        const float *indice_k = indice + k * outputSize;

        gradInput_k[(int)(indice_k[i] - 1)] = gradOutput_k[i]; // Assign computed value
    }
}