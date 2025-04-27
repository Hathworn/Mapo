#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysCopyExtract_C2C_FixedOffset(const float2 *imageIn, const int inNX, const int inNY, float2 *imageOut, const int outNX, const int outNY, const int nImages, const int offsetX, const int offsetY)
{
    // Calculate global position
    int outx = threadIdx.x + blockDim.x * blockIdx.x;
    int outy = threadIdx.y + blockDim.y * blockIdx.y;
    int imgIdx = blockIdx.z;

    // Single condition check to ensure thread is within bounds
    if (outx < outNX && outy < outNY && imgIdx < nImages)
    {
        // Calculate indexes
        int idxOut = (imgIdx * outNX + outx) * outNY + outy;
        int idxIn = (imgIdx * inNX + outx + offsetX) * inNY + outy + offsetY;

        // Copy input to output
        imageOut[idxOut] = imageIn[idxIn];
    }
}