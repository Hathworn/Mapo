#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuArraysCopyExtractVaryingOffsetCorr(const float *imageIn, const int inNX, const int inNY, float *imageOut, const int outNX, const int outNY, int *imageValid, const int nImages, const int2 *maxloc)
{
    // Calculate work item indices
    int idxImage = blockIdx.z;
    int outx = blockIdx.x * blockDim.x + threadIdx.x;
    int outy = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute corresponding input indices
    int inx = outx + maxloc[idxImage].x - outNX / 2;
    int iny = outy + maxloc[idxImage].y - outNY / 2;

    if (outx < outNX && outy < outNY) {
        int idxOut = idxImage * outNX * outNY + outx * outNY + outy;
        
        // Check boundary and copy data
        if (inx >= 0 && iny >= 0 && inx < inNX && iny < inNY) {
            int idxIn = idxImage * inNX * inNY + inx * inNY + iny;
            imageOut[idxOut] = imageIn[idxIn];
            imageValid[idxOut] = 1;
        } else {
            imageOut[idxOut] = 0.0f;
            imageValid[idxOut] = 0;
        }
    }
}