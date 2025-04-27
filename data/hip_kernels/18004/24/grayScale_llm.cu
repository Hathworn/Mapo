#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void grayScale(unsigned char* imgInput, unsigned char* imgOutput, int Row, int Col) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < Row && col < Col) {  // Correct boundary check
        int idx = (row * Col + col) * 3;  // Precompute index
        imgOutput[row * Col + col] = imgInput[idx + 2] * 0.299f + imgInput[idx + 1] * 0.587f + imgInput[idx] * 0.114f;  // Use float constants
    }
}