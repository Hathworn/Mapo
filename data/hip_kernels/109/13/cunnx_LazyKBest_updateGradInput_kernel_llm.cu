#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_LazyKBest_updateGradInput_kernel(float *gradInput, const float *indice, const float *gradOutput, int inputSize, int outputSize)
{
    // Use shared memory for coalesced access
    __shared__ float s_gradOutput[1024];
    __shared__ float s_indice[1024];

    int tx = threadIdx.x;
    int k = blockIdx.x;

    float *gradInput_k = gradInput + k * inputSize;
    const float *gradOutput_k = gradOutput + k * outputSize;
    const float *indice_k = indice + k * outputSize;

    // Load gradOutput and indice into shared memory
    for (int i = tx; i < outputSize; i += blockDim.x) {
        s_gradOutput[i] = gradOutput_k[i];
        s_indice[i] = indice_k[i];
    }
    __syncthreads();

    // Use shared memory for writing gradInput
    for (int i = tx; i < outputSize; i += blockDim.x) {
        gradInput_k[(int)(s_indice[i] - 1)] = s_gradOutput[i];
    }
}