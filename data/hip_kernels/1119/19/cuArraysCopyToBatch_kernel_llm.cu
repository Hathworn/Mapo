#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysCopyToBatch_kernel(const float2 *imageIn, const int inNX, const int inNY, float2 *imageOut, const int outNX, const int outNY, const int nImagesX, const int nImagesY, const int strideX, const int strideY)
{
    // Calculate 1D global thread index for efficiency
    int outx = blockDim.x * blockIdx.x + threadIdx.x;
    int outy = blockDim.y * blockIdx.y + threadIdx.y;
    int idxImage = blockIdx.z;

    if (outx >= outNX || outy >= outNY || idxImage >= nImagesX * nImagesY) return;

    // Compute output index
    int idxOut = idxImage * outNX * outNY + outx * outNY + outy;

    // Pre-compute strides for image index calculation
    int idxImageX = idxImage / nImagesY;
    int idxImageY = idxImage % nImagesY;

    // Compute input index using precalculated strides
    int idxIn = (idxImageX * strideX + outx) * inNY + (idxImageY * strideY + outy);

    // Copy pixel from input to output
    imageOut[idxOut] = imageIn[idxIn];
}