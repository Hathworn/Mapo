#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaKernel_maxlocPlusZoominOffset(float *offset, const int *padStart, const int *maxlocUpSample, const size_t nImages, float zoomInRatioX, float zoomInRatioY)
{
    int imageIndex = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if (imageIndex < nImages)
    {
        int index = imageIndex * 2; // Optimize index calculation
        // Calculate and write offset using computed indices
        offset[index] = padStart[index] + maxlocUpSample[index] * zoomInRatioX;
        offset[index + 1] = padStart[index + 1] + maxlocUpSample[index + 1] * zoomInRatioY;
    }
}