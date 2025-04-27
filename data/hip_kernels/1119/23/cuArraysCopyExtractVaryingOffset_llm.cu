#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysCopyExtractVaryingOffset(const float *imageIn, const int inNX, const int inNY, float *imageOut, const int outNX, const int outNY, const int nImages, const int2 *offsets)
{
    // Calculate global thread index for 2D plane
    int outx = threadIdx.x + blockDim.x * blockIdx.x;
    int outy = threadIdx.y + blockDim.y * blockIdx.y;
    int idxImage = blockIdx.z;
    
    // Only proceed if thread's indexes are within bounds
    if(outx < outNX && outy < outNY)
    {
        // Compute input and output indices more efficiently
        int offsetX = offsets[idxImage].x;
        int offsetY = offsets[idxImage].y;

        int idxOut = (idxImage * outNX + outx) * outNY + outy;
        int idxIn = ((idxImage * inNX) + (outx + offsetX)) * inNY + (outy + offsetY);

        imageOut[idxOut] = imageIn[idxIn];
    }
}