#include "hip/hip_runtime.h"
#include "includes.h"

#define WINDOWSPARSE_THREADS 256

__global__ void cunnx_WindowSparse_accGradParameters_kernel( float *gradWeight, float* gradBias, float *gradOutput, float *input, float *inputIndice, float *outputIndice, int inputWindowSize, int outputWindowSize, int inputSize, int outputSize, float scale)
{
    __shared__ float buffer[WINDOWSPARSE_THREADS];
    int tx = threadIdx.x;
    int i_step = blockDim.x;
    int k = blockIdx.x;

    int inputIdx = (int)inputIndice[k] - 1;
    int outputIdx = (int)outputIndice[k] - 1;

    float *input_k = input + k*inputWindowSize;
    float *gradOutput_k = gradOutput + k*outputWindowSize;
    float *gradWeight_k = gradWeight + outputIdx*inputSize + inputIdx;
    float *gradBias_k = gradBias + outputIdx;

    // Unroll the loop for input buffer copying and weights accumulation
    for (int i = tx; i < inputWindowSize; i += i_step) {
        // copy input to buffer
        buffer[tx] = input_k[i] * scale;

        // multiply accumulate weights
        #pragma unroll // Unroll to improve parallel execution
        for (int j = 0; j < outputWindowSize; j++) {
            atomicAdd(&(gradWeight_k[j * inputSize + i]), gradOutput_k[j] * buffer[tx]);
        }
    }

    // Unroll the loop for bias accumulation
    #pragma unroll // Unroll to improve parallel execution
    for (int j = tx; j < outputWindowSize; j += i_step) {
        atomicAdd(&(gradBias_k[j]), gradOutput_k[j] * scale);
    }
}