#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void grayscaleVer2D(uchar3* input, uchar3* output, int imageWidth, int imageHeight) {
    int tid_x = threadIdx.x + blockIdx.x * blockDim.x;
    int tid_y = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Ensure within image bounds
    if (tid_x >= imageWidth || tid_y >= imageHeight) return;
    
    // Calculate 1D index from 2D indices
    int tid = tid_x + tid_y * imageWidth;
    
    // Efficiently compute grayscale value by avoiding division within the averaging process
    unsigned char grayValue = (input[tid].x + input[tid].y + input[tid].z) / 3;
    output[tid] = make_uchar3(grayValue, grayValue, grayValue); // Avoid repetition by leveraging symmetry
}