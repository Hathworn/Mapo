#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_conv2D_updateDeltas(double* delta, double* biasDelta, const double* upStreamActivation, const double* err, double momentum, size_t kernelCount, size_t kernelRows, size_t kernelCols, size_t outputRows, size_t outputCols, size_t inputChannels, size_t inputRows, size_t inputCols, size_t padding, size_t stride)
{
    // Get unique thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    size_t i = id % outputCols;
    id /= outputCols;
    size_t j = id % outputRows;
    id /= outputRows;
    if (id >= kernelCount) return;
    size_t k = id;

    // Precompute offsets to avoid redundant calculations
    size_t outChannelOffset = k * outputRows * outputCols;
    size_t outRowOffset = j * outputCols;
    int inRowOffset = j * stride - padding;
    size_t kk = k * inputChannels * kernelRows * kernelCols;
    size_t index = outChannelOffset + outRowOffset + i;
    int inColOffset = i * stride - padding;

    // Atomic operation to ensure correctness when updating biasDelta
    atomicAdd(&biasDelta[k], err[index]);

    // Loop over input channels and kernel dimensions
    for (size_t z = 0; z < inputChannels; z++) {
        size_t kernelChannelOffset = z * kernelRows * kernelCols;
        size_t inChannelOffset = z * inputRows * inputCols;
        for (size_t y = 0; y < kernelRows; y++) {
            size_t kernelRowOffset = y * kernelCols;
            int inRow = inRowOffset + y;
            for (size_t x = 0; x < kernelCols; x++) {
                int inCol = inColOffset + x;

                // Check boundary conditions for input indices
                if (inRow >= 0 && inRow < (int)inputRows && inCol >= 0 && inCol < (int)inputCols) {
                    size_t idx = inChannelOffset + inputCols * inRow + inCol;

                    // Atomic operation to ensure correctness when updating delta
                    atomicAdd(&delta[kk + kernelChannelOffset + kernelRowOffset + x], err[index] * upStreamActivation[idx]);
                }
            }
        }
    }
}