#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float logarithmic_mapping(float k, float q, float val_pixel) {
    return (log10(1 + q * val_pixel)) / (log10(1 + k * maxLum));
}

__global__ void tonemap_logarithmic(float* imageIn, float* imageOut, int width, int height, int channels, int depth, float q, float k) {
    // Calculate one-dimensional index for better memory coalescing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensuring idx is within bounds of the image
    if (idx < width * height) {
        int pixelOffset = idx * 3;  // Each pixel has 3 channels: BLUE, GREEN, RED
        imageOut[pixelOffset + BLUE] = logarithmic_mapping(k, q, imageIn[pixelOffset + BLUE]);
        imageOut[pixelOffset + GREEN] = logarithmic_mapping(k, q, imageIn[pixelOffset + GREEN]);
        imageOut[pixelOffset + RED] = logarithmic_mapping(k, q, imageIn[pixelOffset + RED]);
    }
}