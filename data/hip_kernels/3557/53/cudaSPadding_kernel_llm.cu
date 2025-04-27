#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSPadding_kernel(unsigned int nbOutputs, unsigned int outputWidth, unsigned int outputHeight, unsigned int nbChannels, unsigned int batchSize, unsigned int inputWidth, unsigned int inputHeight, int leftPad, int rightPad, int topPad, int botPad, const float* input, float* outputs)
{
    // Calculate input and output offsets
    const unsigned int inputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * nbChannels * inputWidth * inputHeight;
    const unsigned int outputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * nbOutputs * outputWidth * outputHeight;

    // Calculate the number of channels to process
    const unsigned int nbCh = min(nbChannels, nbOutputs);

    // Loop over channels with blockIdx.x as index
    for (unsigned int ch = blockIdx.x; ch < nbCh; ch += gridDim.x) {
        // Loop over output height with threadIdx.y as index
        for (unsigned int oy = threadIdx.y; oy < outputHeight; oy += blockDim.y) {
            // Loop over output width with threadIdx.x as index
            for (unsigned int ox = threadIdx.x; ox < outputWidth; ox += blockDim.x) {
                float outputValue = 0.0f;
                int ix = static_cast<int>(ox) - leftPad;
                int iy = static_cast<int>(oy) - topPad;

                // Check if indices are within input bounds
                if (ix >= 0 && ix < static_cast<int>(inputWidth) && iy >= 0 && iy < static_cast<int>(inputHeight)) {
                    outputValue = input[ix + iy * inputWidth + ch * inputWidth * inputHeight + inputOffset];
                }
                
                // Write output value
                outputs[ox + oy * outputWidth + ch * outputWidth * outputHeight + outputOffset] = outputValue;
            }
        }
    }
}