#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSPadding_kernel(unsigned int nbOutputs, unsigned int outputWidth, unsigned int outputHeight, unsigned int nbChannels, unsigned int batchSize, unsigned int inputWidth, unsigned int inputHeight, int leftPad, int rightPad, int topPad, int botPad, const float* input, float* outputs) {

    const unsigned int inputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * nbChannels * inputWidth * inputHeight;
    const unsigned int outputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * nbOutputs * outputWidth * outputHeight;

    // nbCh = nbChannels for propagate = nbOutputs for back-propagate
    const unsigned int nbCh = min(nbChannels, nbOutputs);

    for (unsigned int ch = blockIdx.x; ch < nbCh; ch += gridDim.x) {
        for (unsigned int oy = threadIdx.y; oy < outputHeight; oy += blockDim.y) {
            for (unsigned int ox = threadIdx.x; ox < outputWidth; ox += blockDim.x) {

                int ix = (int)ox - leftPad;
                int iy = (int)oy - topPad;

                // Use shared memory for faster access
                __shared__ float sharedInput[blockDim.y][blockDim.x];
                float outputValue = 0.0f;

                if (ix >= 0 && ix < (int)inputWidth && iy >= 0 && iy < (int)inputHeight) {
                    // Load from input into shared memory
                    sharedInput[threadIdx.y][threadIdx.x] = input[ix + iy * inputWidth + ch * inputWidth * inputHeight + inputOffset];
                    __syncthreads();
                    outputValue = sharedInput[threadIdx.y][threadIdx.x];
                }

                outputs[ox + oy * outputWidth + ch * outputWidth * outputHeight + outputOffset] = outputValue;
            }
        }
    }
}