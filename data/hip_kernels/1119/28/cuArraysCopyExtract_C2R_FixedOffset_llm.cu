#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysCopyExtract_C2R_FixedOffset(const float2 *imageIn, const int inNX, const int inNY, float *imageOut, const int outNX, const int outNY, const int nImages, const int offsetX, const int offsetY)
{
    // Calculate output indices
    int outx = threadIdx.x + blockDim.x * blockIdx.x;
    int outy = threadIdx.y + blockDim.y * blockIdx.y;

    // Check bounds and calculate indices for input and output
    if (outx < outNX && outy < outNY)
    {
        int idxOut = (blockIdx.z * outNX + outx) * outNY + outy;
        int idxIn = (blockIdx.z * inNX + (outx + offsetX)) * inNY + (outy + offsetY);
        
        // Perform copy operation
        imageOut[idxOut] = imageIn[idxIn].x;
    }
}