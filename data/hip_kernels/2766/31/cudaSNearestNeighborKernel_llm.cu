#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSNearestNeighborKernel(const float* input, size_t inputSizeX, size_t inputSizeY, float* output, size_t outputSizeX, size_t outputSizeY, size_t nbChannels, size_t batchSize)
{
    const size_t inputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * (nbChannels * inputSizeY * inputSizeX);
    const size_t outputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * (nbChannels * outputSizeY * outputSizeX);

    const float multy = ((float) inputSizeY) / ((float) outputSizeY);
    const float multx = ((float) inputSizeX) / ((float) outputSizeX);

    size_t channel = blockIdx.x * blockDim.x + threadIdx.x; // Use threads for channels
    size_t oy = blockIdx.y * blockDim.y + threadIdx.y; // Use threads for output y-coordinates

    if (channel < nbChannels && oy < outputSizeY) {
        // Calculate input index
        size_t iy = static_cast<size_t>(oy * multy);
        float* outputPtr = output + outputOffset + channel * outputSizeY * outputSizeX + oy * outputSizeX;

        for(size_t ox = threadIdx.x; ox < outputSizeX; ox += blockDim.x * gridDim.x) { // Coalesce memory access for output
            size_t ix = static_cast<size_t>(ox * multx);

            outputPtr[ox] = input[inputOffset + channel * inputSizeY * inputSizeX + iy * inputSizeX + ix];
        }
    }
}