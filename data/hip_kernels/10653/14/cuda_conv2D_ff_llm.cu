#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_conv2D_ff(double* pA, double* pNet, const double* in, const double* pKernels, const double* pBias, size_t kernelCount, size_t kernelRows, size_t kernelCols, size_t outputRows, size_t outputCols, size_t inputRows, size_t inputCols, size_t inputChannels, size_t padding, size_t stride)
{
    // Calculate global ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    size_t i = id % outputCols;
    id /= outputCols;
    size_t j = id % outputRows;
    id /= outputRows;
    if(id >= kernelCount) return;
    size_t k = id;

    // Pre-calculate channel offsets
    size_t outChannelOffset = k * outputRows * outputCols;
    size_t outRowOffset = j * outputCols;
    int inRowOffset = j * stride - padding;
    size_t kk = k * inputChannels * kernelRows * kernelCols;
    size_t index = outChannelOffset + outRowOffset + i;
    int inColOffset = i * stride - padding;

    // Initialize output with bias
    pNet[index] = pBias[k];

    // Use nested loops for the convolution operation
    for(size_t z = 0; z < inputChannels; z++)
    {
        size_t kernelChannelOffset = z * kernelRows * kernelCols;
        size_t inChannelOffset = z * inputRows * inputCols;
        for(size_t y = 0; y < kernelRows; y++)
        {
            size_t kernelRowOffset = y * kernelCols;
            int inRow = inRowOffset + y;
            for(size_t x = 0; x < kernelCols; x++)
            {
                int inCol = inColOffset + x;
                // Perform bounds check to ensure valid access
                if(inRow >= 0 && inRow < (int)inputRows && inCol >= 0 && inCol < (int)inputCols)
                {
                    size_t idx = inChannelOffset + inputCols * inRow + inCol;
                    // Accumulate result using kernel weights
                    pNet[index] += pKernels[kk + kernelChannelOffset + kernelRowOffset + x] * in[idx];
                }
            }
        }
    }

    // Apply activation function
    pA[index] = tanh(pNet[index]);
}