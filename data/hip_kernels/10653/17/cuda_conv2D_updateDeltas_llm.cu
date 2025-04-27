#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_conv2D_updateDeltas(double* delta, double* biasDelta, const double* upStreamActivation, const double* err, double momentum, size_t kernelCount, size_t kernelRows, size_t kernelCols, size_t outputRows, size_t outputCols, size_t inputChannels, size_t inputRows, size_t inputCols, size_t padding, size_t stride) {
    // Optimize with early exit for out-of-range kernels
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= kernelCount * outputRows * outputCols)
        return;

    // Calculate parallel indices more efficiently
    size_t i = id % outputCols;
    size_t j = (id / outputCols) % outputRows;
    size_t k = id / (outputCols * outputRows);

    // Compute static offsets outside of loops
    size_t outChannelOffset = k * outputRows * outputCols;
    size_t outRowOffset = j * outputCols;
    size_t kk = k * inputChannels * kernelRows * kernelCols;
    size_t index = outChannelOffset + outRowOffset + i;
    int inRowOffset = j * stride - padding;
    int inColOffset = i * stride - padding;

    // Atomic addition to avoid race conditions
    atomicAdd(&biasDelta[k], err[index]);

    for(size_t z = 0; z < inputChannels; z++) {
        size_t kernelChannelOffset = z * kernelRows * kernelCols;
        size_t inChannelOffset = z * inputRows * inputCols;
        for(size_t y = 0; y < kernelRows; y++) {
            int inRow = inRowOffset + y;
            if(inRow >= 0 && inRow < (int)inputRows) { // Check row bounds
                size_t kernelRowOffset = y * kernelCols;
                for(size_t x = 0; x < kernelCols; x++) {
                    int inCol = inColOffset + x;
                    if(inCol >= 0 && inCol < (int)inputCols) { // Check col bounds
                        size_t idx = inChannelOffset + inputCols * inRow + inCol;
                        atomicAdd(&delta[kk + kernelChannelOffset + kernelRowOffset + x], err[index] * upStreamActivation[idx]);
                    }
                }
            }
        }
    }
}