#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSBilinearTF_Forward_kernel( unsigned int outputWidth, unsigned int outputHeight, unsigned int nbChannels, unsigned int batchSize, unsigned int inputWidth, unsigned int inputHeight, const unsigned int* yLowIdx, const unsigned int* yHighIdx, const float* yInter, const unsigned int* xLowIdx, const unsigned int* xHighIdx, const float* xInter, const float* input, float* outputs)
{
    const unsigned int inputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * nbChannels * inputWidth * inputHeight;
    const unsigned int outputOffset = (blockIdx.z * blockDim.z + threadIdx.z) * nbChannels * outputWidth * outputHeight;

    // Using shared memory for input indices and interpolation values
    __shared__ unsigned int shared_yLowIdx[1024];
    __shared__ unsigned int shared_yHighIdx[1024];
    __shared__ float shared_yInter[1024];
    __shared__ unsigned int shared_xLowIdx[1024];
    __shared__ unsigned int shared_xHighIdx[1024];
    __shared__ float shared_xInter[1024];

    // Load shared memory
    shared_yLowIdx[threadIdx.x] = yLowIdx[threadIdx.x];
    shared_yHighIdx[threadIdx.x] = yHighIdx[threadIdx.x];
    shared_yInter[threadIdx.x] = yInter[threadIdx.x];
    shared_xLowIdx[threadIdx.x] = xLowIdx[threadIdx.x];
    shared_xHighIdx[threadIdx.x] = xHighIdx[threadIdx.x];
    shared_xInter[threadIdx.x] = xInter[threadIdx.x];

    __syncthreads(); // Synchronize threads after loading shared memory

    for (unsigned int ch = blockIdx.x; ch < nbChannels; ch += gridDim.x) {
        for (unsigned int oy = threadIdx.y; oy < outputHeight; oy += blockDim.y) {
            for (unsigned int ox = threadIdx.x; ox < outputWidth; ox += blockDim.x) {
                const unsigned int indexTL = shared_xLowIdx[ox] + shared_yLowIdx[oy] * inputWidth + ch * inputWidth * inputHeight + inputOffset;
                const unsigned int indexTR = shared_xHighIdx[ox] + shared_yLowIdx[oy] * inputWidth + ch * inputWidth * inputHeight + inputOffset;
                const unsigned int indexBL = shared_xLowIdx[ox] + shared_yHighIdx[oy] * inputWidth + ch * inputWidth * inputHeight + inputOffset;
                const unsigned int indexBR = shared_xHighIdx[ox] + shared_yHighIdx[oy] * inputWidth + ch * inputWidth * inputHeight + inputOffset;

                const float top_left = input[indexTL];
                const float top_right = input[indexTR];
                const float bottom_left = input[indexBL];
                const float bottom_right = input[indexBR];

                const float top = top_left + (top_right - top_left) * shared_xInter[ox];
                const float bottom = bottom_left + (bottom_right - bottom_left) * shared_xInter[ox];

                outputs[ox + oy * outputWidth + ch * outputWidth * outputHeight + outputOffset] = top + (bottom - top) * shared_yInter[oy];
            }
        }
    }
}