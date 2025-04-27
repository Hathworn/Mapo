#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelReadMotionEnergyAsync(float* gpuConvBufferl1, float* gpuConvBufferl2, int ringBufferIdx, int bsx, int bsy, int n, float* gpuEnergyBuffer)
{
    int bufferPos = threadIdx.x + blockIdx.x * blockDim.x;
    if(bufferPos < n) {
        // Precompute the constant index offset outside the loop
        int offset = ringBufferIdx * bsx * bsy;
        int bufferPosConv = bufferPos + offset;

        // Access memory once and store in registers
        float l1 = gpuConvBufferl1[bufferPosConv];
        float l2 = gpuConvBufferl2[bufferPosConv];

        // Use the fmaf function for optimized computation (fmaf(a, b, c) computes a * b + c)
        gpuEnergyBuffer[bufferPos] = sqrtf(fmaf(l1, l1, l2 * l2));
    }
}