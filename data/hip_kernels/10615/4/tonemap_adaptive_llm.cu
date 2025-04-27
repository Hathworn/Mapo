#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float adaptive_mapping(float k, float q, float val_pixel){
    return (k * log(1 + val_pixel)) / ((100 * log10(1 + maxLum)) * (powf((log(2 + 8 * (val_pixel / maxLum))), (log(q) / log(0.5)))));
}

__global__ void tonemap_adaptive(float* imageIn, float* imageOut, int width, int height, int channels, int depth, float q, float k) {
    // Optimize by calculating the pixel index once
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    if (Row < height && Col < width) {
        int index = (Row * width + Col) * 3;
        // Avoid redundant image index calculations
        imageOut[index + BLUE] = adaptive_mapping(k, q, imageIn[index + BLUE]);
        imageOut[index + GREEN] = adaptive_mapping(k, q, imageIn[index + GREEN]);
        imageOut[index + RED] = adaptive_mapping(k, q, imageIn[index + RED]);
    }
}