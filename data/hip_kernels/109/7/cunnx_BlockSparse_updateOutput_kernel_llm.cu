#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunnx_BlockSparse_updateOutput_kernel( float *output, const float *input, const float *outputIndice, const float *outputScale, const float *bias, int outputSize, int nOutputBlock, int inputWindowSize, int outputWindowSize)
{
    // Use shared memory for better memory access efficiency
    __shared__ float buffer[BLOCKSPARSE_THREADS];

    int tx = threadIdx.x;
    int k = blockIdx.x;
    
    // Pre-calculate strides to avoid repeated multiplication
    int outputOffset = k * outputWindowSize * outputSize;
    int inputOffset = k * inputWindowSize * outputWindowSize * outputSize;
    int indiceOffset = k * outputWindowSize;
    int scaleOffset = k * outputWindowSize;

    // Pointer arithmetic for each k block
    float *output_k = output + outputOffset;
    const float *input_k = input + inputOffset;
    const float *outputIndice_k = outputIndice + indiceOffset;
    const float *outputScale_k = outputScale + scaleOffset;

    for (int m = 0; m < outputWindowSize; m++)
    {
        int outputIdx = (int)outputIndice_k[m] - 1;
        float outputScale = outputScale_k[m];
        
        for (int j = tx; j < outputSize; j += blockDim.x)
        {
            // Load bias into shared memory once
            float sum = bias[outputIdx * outputSize + j];

            // Accumulate input data
            for (int l = 0; l < inputWindowSize; l++)
            {
                sum += input_k[l * outputWindowSize * outputSize + m * outputSize + j];
            }

            // Store computed result to global memory
            output_k[m * outputSize + j] = outputScale * sum;
        }
    }
}