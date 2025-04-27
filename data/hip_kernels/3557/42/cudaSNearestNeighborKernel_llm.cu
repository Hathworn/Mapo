#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSNearestNeighborKernel(const float* input, size_t inputSizeX, size_t inputSizeY, float* output, size_t outputSizeX, size_t outputSizeY, size_t nbChannels, size_t batchSize)
{
    // Calculate input and output offsets
    const size_t inputOffset = blockIdx.z * nbChannels * inputSizeY * inputSizeX + threadIdx.z * nbChannels * inputSizeY * inputSizeX;
    const size_t outputOffset = blockIdx.z * nbChannels * outputSizeY * outputSizeX + threadIdx.z * nbChannels * outputSizeY * outputSizeX;

    // Precompute multipliers for coordinate mapping
    const float multy = static_cast<float>(inputSizeY) / static_cast<float>(outputSizeY);
    const float multx = static_cast<float>(inputSizeX) / static_cast<float>(outputSizeX);

    // Calculate channel index
    size_t channel = blockIdx.x * blockDim.z + threadIdx.z;
    while (channel < nbChannels) {
        // Calculate destination pixel position
        size_t oy = threadIdx.y + blockIdx.y * blockDim.y;
        while (oy < outputSizeY) {
            size_t ox = threadIdx.x + blockIdx.x * blockDim.x;
            while (ox < outputSizeX) {
                // Calculate source pixel position
                const size_t iy = static_cast<size_t>(oy * multy);
                const size_t ix = static_cast<size_t>(ox * multx);

                // Perform the nearest neighbor mapping
                output[outputOffset + channel * outputSizeY * outputSizeX + oy * outputSizeX + ox] =
                    input[inputOffset + channel * inputSizeY * inputSizeX + iy * inputSizeX + ix];

                ox += blockDim.x * gridDim.x; // Advance in x-direction
            }
            oy += blockDim.y * gridDim.y; // Advance in y-direction
        }
        channel += blockDim.z * gridDim.z; // Advance channel-wise
    }
}