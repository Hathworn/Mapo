#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCKSPARSE_THREADS 256
#define BLOCKSPARSE_MAXOUTPUTBLOCKSIZE 128

__global__ void cunnx_BlockSparse_accGradParameters_kernel( float *gradWeight, float* gradBias, float *gradOutput, float *input, float *inputIndice, float *outputIndice, int inputSize, int outputSize, int nInputBlock, int nOutputBlock, int inputWindowSize, int outputWindowSize, float scale)
{
    __shared__ float buffer[BLOCKSPARSE_THREADS];
    __shared__ float gradOutputBuffer[BLOCKSPARSE_MAXOUTPUTBLOCKSIZE];
    int tx = threadIdx.x;
    int i_step = blockDim.x;
    int k = blockIdx.x;

    float *input_k = input + k * inputWindowSize * inputSize;
    float *gradOutput_k = gradOutput + k * outputWindowSize * outputSize;
    float *inputIndice_k = inputIndice + k * inputWindowSize;
    float *outputIndice_k = outputIndice + k * outputWindowSize;

    for (int m = 0; m < outputWindowSize; m++)
    {
        int outputIdx = (int)outputIndice_k[m] - 1;
        float *blockGradOutput = gradOutput_k + m * outputSize;
        float *blockGradBias = gradBias + outputIdx * outputSize;

        for (int j = tx; j < outputSize; j += i_step)
            gradOutputBuffer[j] = blockGradOutput[j] * scale;

        __syncthreads();

        for (int l = 0; l < inputWindowSize; l++)
        {
            int inputIdx = (int)inputIndice_k[l] - 1;
            float *blockInput = input_k + l * inputSize;
            float *blockGradWeight = gradWeight + outputIdx * nInputBlock * outputSize * inputSize + inputIdx * outputSize * inputSize;

            // Efficient global memory access by coalescing
            for (int i = tx; i < inputSize; i += i_step)
            {
                buffer[tx] = blockInput[i]; // Use shared memory for input

                // Optimized atomic operation
                for (int j = 0; j < outputSize; j++)
                    atomicAdd(&(blockGradWeight[j * inputSize + i]), gradOutputBuffer[j] * buffer[tx]);
            }
        }

        __syncthreads();

        // Efficient atomic addition for biases
        for (int j = tx; j < outputSize; j += i_step)
            atomicAdd(&(blockGradBias[j]), gradOutputBuffer[j]);
    }
}