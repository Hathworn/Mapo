#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysCopyToBatchWithOffset_kernel(const float2 *imageIn, const int inNY, float2 *imageOut, const int outNX, const int outNY, const int nImages, const int *offsetX, const int *offsetY)
{
    // Calculate global thread coordinates
    int idxImage = blockIdx.z;
    int outx = threadIdx.x + blockDim.x * blockIdx.x;
    int outy = threadIdx.y + blockDim.y * blockIdx.y;

    // Early exit for threads outside the image range
    if(idxImage >= nImages || outx >= outNX || outy >= outNY) return;

    // Calculate flat indices for input and output arrays
    int idxOut = idxImage * outNX * outNY + outx * outNY + outy;
    int idxIn = (offsetX[idxImage] + outx) * inNY + offsetY[idxImage] + outy;

    // Copy image data from input to output
    imageOut[idxOut] = imageIn[idxIn];
}