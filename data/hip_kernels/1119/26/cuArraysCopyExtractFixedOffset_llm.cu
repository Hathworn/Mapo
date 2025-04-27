#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuArraysCopyExtractFixedOffset(const float *imageIn, const int inNX, const int inNY, float *imageOut, const int outNX, const int outNY, const int nImages, const int offsetX, const int offsetY)
{
    // Precompute constants
    const int outXY = outNX * outNY;
    const int inXY = inNX * inNY;

    // Calculate output indices
    int outx = threadIdx.x + blockDim.x * blockIdx.x;
    int outy = threadIdx.y + blockDim.y * blockIdx.y;
    int outz = blockIdx.z;

    // Check bounds first
    if (outx < outNX && outy < outNY)
    {
        // Compute flattened index for output and input arrays
        int idxOut = outz * outXY + outx * outNY + outy;
        int idxIn = outz * inXY + (outx + offsetX) * inNY + (outy + offsetY);

        // Copy data from input to output
        imageOut[idxOut] = imageIn[idxIn];
    }
}