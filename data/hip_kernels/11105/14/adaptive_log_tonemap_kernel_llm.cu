#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float adaptive_logarithmic_mapping(float lw_max, float ld_max, float lw, float b)
{
    float ld = (ld_max / (100.0f * log10f(1.0f + lw_max))) *
               (logf(1.0f + lw) / (logf(2.0f + 8.0f * powf((lw / lw_max), (logf(b) / logf(0.5f))))));
    return ld;
}

__device__ float logarithmic_mapping(float k, float q, float val_pixel, float maxLum)
{
    return (log10f(1.0f + q * val_pixel)) / (log10f(1.0f + k * maxLum));
}

__device__ float rgb2Lum(float B, float G, float R)
{
    return B * 0.0722f + G * 0.7152f + R * 0.2126f;
}

__global__ void adaptive_log_tonemap_kernel(float* imageIn, float* imageOut, int width, int height, int channels, float b, float ld_max, float* max)
{
    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if within image boundaries
    if (Row < height && Col < width) {
        // Calculate linear index for 3-channel image data
        int idx = (Row * width + Col) * 3;

        // Read input image values
        float B = imageIn[idx + BLUE];
        float G = imageIn[idx + GREEN];
        float R = imageIn[idx + RED];

        // Calculate luminance
        float L = rgb2Lum(B, G, R);

        // Perform adaptive logarithmic mapping
        float nL = adaptive_logarithmic_mapping(*max, ld_max, L, b);

        // Calculate scale and apply to each channel
        float scale = nL / L;
        imageOut[idx + BLUE] = B * scale;
        imageOut[idx + GREEN] = G * scale;
        imageOut[idx + RED] = R * scale;
    }
}