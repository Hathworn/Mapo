#include "hip/hip_runtime.h"
#include "includes.h"

#define BLUE 0
#define GREEN 1
#define RED 2

__device__ float gamma_correction(float f_stop, float gamma, float val) {
    return powf((val * powf(2.0, f_stop)), (1.0 / gamma));
}

__device__ float rgb2Lum(float B, float G, float R) {
    return B * 0.0722 + G * 0.7152 + R * 0.2126;
}

__global__ void gamma_tonemap_kernel(float* imageIn, float* imageOut, int width, int height, int channels, float f_stop, float gamma) {
    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure processing within image bounds
    if (Row < height && Col < width) {
        int index = (Row * width + Col) * channels; // Precompute index for readability and reuse
        float B = imageIn[index + BLUE];
        float G = imageIn[index + GREEN];
        float R = imageIn[index + RED];

        float L = rgb2Lum(B, G, R);
        float nL = gamma_correction(f_stop, gamma, L);
        float scale = nL / L;

        imageOut[index + BLUE] = B * scale;
        imageOut[index + GREEN] = G * scale;
        imageOut[index + RED] = R * scale;
    }
}