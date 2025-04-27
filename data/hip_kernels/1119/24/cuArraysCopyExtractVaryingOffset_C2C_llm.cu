#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysCopyExtractVaryingOffset_C2C(const float2 *imageIn, const int inNX, const int inNY, float2 *imageOut, const int outNX, const int outNY, const int nImages, const int2 *offsets)
{
    // Calculate 1D index for threads for coalesced memory access
    int threadX = blockIdx.x * blockDim.x + threadIdx.x;
    int threadY = blockIdx.y * blockDim.y + threadIdx.y;
    int threadZ = blockIdx.z; // Each block in z-dimension handles different image

    // Ensure within output bounds
    if (threadX < outNX && threadY < outNY)
    {
        // Calculate input and output indices
        int idxOut = (threadZ * outNX + threadX) * outNY + threadY;
        int offsetX = offsets[threadZ].x;
        int offsetY = offsets[threadZ].y;
        int idxIn = (threadZ * inNX + threadX + offsetX) * inNY + threadY + offsetY;
        
        // Perform data copy
        imageOut[idxOut] = imageIn[idxIn];
    }
}