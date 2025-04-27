#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float gamma_correction(float f_stop, float gamma, float val)
{
    return powf((val * powf(2, f_stop)), (1.0 / gamma));
}
__global__ void tonemap_gamma(float* imageIn, float* imageOut, int width, int height, int channels, int depth, float f_stop, float gamma)
{
    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    if(Row < height && Col < width) {
        int idx = (Row * width + Col) * 3; // Calculate base index once
        // Apply gamma correction efficiently
        imageOut[idx + BLUE] = gamma_correction(f_stop, gamma, imageIn[idx + BLUE]);
        imageOut[idx + GREEN] = gamma_correction(f_stop, gamma, imageIn[idx + GREEN]);
        imageOut[idx + RED] = gamma_correction(f_stop, gamma, imageIn[idx + RED]);
    }
}