#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_conv2D_backPropError(double* upStreamError, const double* err, const double* pKernels, size_t kernelCount, size_t kernelRows, size_t kernelCols, size_t outputRows, size_t outputCols, size_t inputChannels, size_t inputRows, size_t inputCols, size_t padding, size_t stride)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    size_t i = id % inputChannels;
    id /= inputChannels;
    size_t j = id % outputRows;
    id /= outputRows;
    if(id >= kernelCount)
        return;
    size_t k = id;

    // Precompute offsets for faster access
    size_t outChannelOffset = k * outputRows * outputCols;
    size_t outRowOffset = j * outputCols;
    int inColOffset = i * stride - padding;
    int inRowOffset = j * stride - padding;
    size_t kk = k * inputChannels * kernelRows * kernelCols;
    size_t index = outChannelOffset + outRowOffset + i;

    // Using loop interchange to enhance memory locality
    for(size_t z = 0; z < inputChannels; z++)
    {
        size_t kernelChannelOffset = z * kernelRows * kernelCols;
        size_t inChannelOffset = z * inputRows * inputCols;
        for(size_t y = 0; y < kernelRows; y++)
        {
            int inRow = inRowOffset + y;
            size_t kernelRowOffset = y * kernelCols;
            for(size_t x = 0; x < kernelCols; x++)
            {
                int inCol = inColOffset + x;
                if(inRow >= 0 && inRow < (int)inputRows && inCol >= 0 && inCol < (int)inputCols)
                {
                    size_t idx = inChannelOffset + inputCols * inRow + inCol;
                    // Use atomic addition to avoid race conditions
                    atomicAdd(&upStreamError[idx], pKernels[kk + kernelChannelOffset + kernelRowOffset + x] * err[index]);
                }
            }
        }
    }
}