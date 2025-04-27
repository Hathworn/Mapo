#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float logarithmic_mapping(float k, float q, float val_pixel, float maxLum) {
    return (log10f(1.0 + q * val_pixel))/(log10f(1.0 + k * maxLum));
}

__device__ float rgb2Lum(float B, float G, float R) {
    return B * 0.0722 + G * 0.7152 + R * 0.2126;
}

__global__ void log_tonemap_kernel(float* imageIn, float* imageOut, int width, int height, int channels, float k, float q, float* max) {
    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure row and column are within image boundaries
    if (Row < height && Col < width) {
        // Load pixel components
        float B = imageIn[(Row * width + Col) * channels + BLUE];
        float G = imageIn[(Row * width + Col) * channels + GREEN];
        float R = imageIn[(Row * width + Col) * channels + RED];

        // Calculate luminance and apply logarithmic tone mapping and scaling
        float L = rgb2Lum(B, G, R);
        float nL = logarithmic_mapping(k, q, L, *max);
        float scale = (L > 0) ? (nL / L) : 0.0f; // Avoid divide by zero

        // Store results back to the output image
        imageOut[(Row * width + Col) * channels + BLUE] = B * scale;
        imageOut[(Row * width + Col) * channels + GREEN] = G * scale;
        imageOut[(Row * width + Col) * channels + RED] = R * scale;
    }
}