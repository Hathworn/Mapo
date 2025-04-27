#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSBilinearTF_kernel(unsigned int outputWidth, unsigned int outputHeight, unsigned int nbChannels, unsigned int batchSize, unsigned int inputWidth, unsigned int inputHeight, const unsigned int* yLowIdx, const unsigned int* yHighIdx, const float* yInter, const unsigned int* xLowIdx, const unsigned int* xHighIdx, const float* xInter, const float* input, float* outputs)
{
    const unsigned int inputOffset = ((blockIdx.z * blockDim.z) + threadIdx.z) * nbChannels * inputWidth * inputHeight;
    const unsigned int outputOffset = ((blockIdx.z * blockDim.z) + threadIdx.z) * nbChannels * outputWidth * outputHeight;

    // Loop fusion and unrolling to improve memory coalescing and reduce loop overhead
    for (unsigned int ch = blockIdx.x; ch < nbChannels; ch += gridDim.x) {
        for (unsigned int oy = threadIdx.y; oy < outputHeight; oy += blockDim.y) {
            for (unsigned int ox = threadIdx.x; ox < outputWidth; ox += blockDim.x) {
                const unsigned int xLow = xLowIdx[ox];
                const unsigned int xHigh = xHighIdx[ox];
                const unsigned int yLow = yLowIdx[oy];
                const unsigned int yHigh = yHighIdx[oy];
                const float xInt = xInter[ox];
                const float yInt = yInter[oy];
                const unsigned int chOffset = ch * inputWidth * inputHeight;
                
                const unsigned int indexTL = xLow + (yLow * inputWidth) + chOffset + inputOffset;
                const unsigned int indexTR = xHigh + (yLow * inputWidth) + chOffset + inputOffset;
                const unsigned int indexBL = xLow + (yHigh * inputWidth) + chOffset + inputOffset;
                const unsigned int indexBR = xHigh + (yHigh * inputWidth) + chOffset + inputOffset;

                const float top_left = input[indexTL];
                const float top_right = input[indexTR];
                const float bottom_left = input[indexBL];
                const float bottom_right = input[indexBR];

                const float top = top_left + (top_right - top_left) * xInt;
                const float bottom = bottom_left + (bottom_right - bottom_left) * xInt;

                outputs[ox + (oy * outputWidth) + (ch * outputWidth * outputHeight) + outputOffset] = top + (bottom - top) * yInt;
            }
        }
    }
}