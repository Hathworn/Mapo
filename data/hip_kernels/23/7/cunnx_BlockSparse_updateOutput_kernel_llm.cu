#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_BlockSparse_updateOutput_kernel( float *output, const float *input, const float *outputIndice, const float *outputScale, const float *bias, int outputSize, int nOutputBlock, int inputWindowSize, int outputWindowSize)
{
    extern __shared__ float buffer[];  // Use dynamic shared memory
    int tx = threadIdx.x;
    int k = blockIdx.x;
    
    float *output_k = output + k * outputWindowSize * outputSize;
    const float *input_k = input + k * inputWindowSize * outputWindowSize * outputSize;
    const float *outputIndice_k = outputIndice + k * outputWindowSize;
    const float *outputScale_k = outputScale + k * outputWindowSize;

    for (int m = 0; m < outputWindowSize; ++m) {
        int outputIdx = static_cast<int>(outputIndice_k[m]) - 1;
        float outputScale = outputScale_k[m];

        for (int j = tx; j < outputSize; j += blockDim.x) {
            // Efficiently load bias
            float tempOutput = bias[outputIdx * outputSize + j];

            // Unroll the loop for efficiency
            for (int l = 0; l < inputWindowSize; ++l) {
                tempOutput += input_k[l * outputWindowSize * outputSize + m * outputSize + j];
            }
            
            // Store the scaled output to global memory
            output_k[m * outputSize + j] = outputScale * tempOutput;
        }
    }
}