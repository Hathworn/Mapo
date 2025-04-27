#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_grey_and_blur(unsigned char* Pout, unsigned char* Pin, int width, int height) {
    int channels = 3;
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    // Check if pixel within range for greyscale conversion
    if (col < width && row < height) {
        int gOffset = row * width + col;
        int rgbOffset = gOffset * channels;
        unsigned char r = Pin[rgbOffset];
        unsigned char g = Pin[rgbOffset + 1];
        unsigned char b = Pin[rgbOffset + 2];
        Pout[gOffset] = 0.21f * r + 0.71f * g + 0.07f * b;
    }
    __syncthreads();

    // Apply blur using shared memory
    __shared__ unsigned char sharedMem[32][32];  // Modify the size based on blockDim for best performance
    if (col < width && row < height) {
        sharedMem[threadIdx.y][threadIdx.x] = Pout[row * width + col];
    }
    __syncthreads();

    unsigned char k_size = 1;
    int pixVal = 0;
    int pixels = 0;
    for(int blurRow = -k_size; blurRow <= k_size; ++blurRow) {
        for(int blurCol = -k_size; blurCol <= k_size; ++blurCol) {
            int curRow = threadIdx.y + blurRow;
            int curCol = threadIdx.x + blurCol;

            if (curRow >= 0 && curRow < blockDim.y && curCol >= 0 && curCol < blockDim.x) {
                pixVal += sharedMem[curRow][curCol];
                pixels++;
            }
        }
    }
    __syncthreads();

    if (col < width && row < height) {
        Pout[row * width + col] = (unsigned char)(pixVal / pixels);
    }
}