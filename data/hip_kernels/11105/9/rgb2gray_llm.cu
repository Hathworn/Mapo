#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by reducing redundant calculations
__global__ void rgb2gray(unsigned char* d_Pin, unsigned char* d_Pout, int width, int height) {
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    
    if ((Row < height) && (Col < width)) {
        int idx = (Row * width + Col) * 3; // Calculate once
        unsigned char blue = d_Pin[idx + BLUE];
        unsigned char green = d_Pin[idx + GREEN];
        unsigned char red = d_Pin[idx + RED];
        
        d_Pout[Row * width + Col] = blue * 0.114 + green * 0.587 + red * 0.299;
    }
}