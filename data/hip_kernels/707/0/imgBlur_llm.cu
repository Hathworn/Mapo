#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void imgBlur(float* imgIn, float* imgOut, int imageWidth, int imageHeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    if (idx < imageWidth && idy < imageHeight)
    {
        float sum = imgIn[idy * imageWidth + idx]; // Correct index calculation

        // Precompute boundaries to avoid repeated checks
        int left = max(0, idx-1);
        int right = min(imageWidth-1, idx+1);
        int up = max(0, idy-1);
        int down = min(imageHeight-1, idy+1);

        // Simplifying neighbor access
        sum += imgIn[up * imageWidth + left];
        sum += imgIn[up * imageWidth + idx];
        sum += imgIn[up * imageWidth + right];
        sum += imgIn[idy * imageWidth + left];
        sum += imgIn[idy * imageWidth + right];
        sum += imgIn[down * imageWidth + left];
        sum += imgIn[down * imageWidth + idx];
        sum += imgIn[down * imageWidth + right];

        imgOut[idy * imageWidth + idx] = sum / 9.0f; // Simplified divisor
    }
}