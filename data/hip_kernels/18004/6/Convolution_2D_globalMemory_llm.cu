#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Convolution_2D_globalMemory(unsigned char* imgInput, unsigned char* imgOutput, const float* mask, int height, int width, int channels) {

    // Use shared memory to reduce global memory accesses
    __shared__ float sharedMask[MASK_WIDTH * MASK_WIDTH];

    int tx = threadIdx.x, ty = threadIdx.y;
    int Row = blockIdx.x * blockDim.x + tx;
    int Col = blockIdx.y * blockDim.y + ty;

    if (tx < MASK_WIDTH && ty < MASK_WIDTH) {
        sharedMask[tx * MASK_WIDTH + ty] = mask[tx * MASK_WIDTH + ty];
    }
    __syncthreads(); // Synchronize to ensure mask is loaded

    if (Row < height && Col < width) {
        for (int c = 0; c < channels; c++) {
            float sum = 0.0f;
            for (int i = 0; i < MASK_WIDTH; i++) {
                int filterRow = Row - MASK_WIDTH / 2 + i;
                for (int j = 0; j < MASK_WIDTH; j++) {
                    int filterCol = Col - MASK_WIDTH / 2 + j;

                    if ((filterRow >= 0) && (filterRow < height) && (filterCol >= 0) && (filterCol < width)) {
                        sum += imgInput[(filterRow * width + filterCol) * channels + c] * sharedMask[i * MASK_WIDTH + j];
                    }
                }
            }
            sum /= MASK_WIDTH * MASK_WIDTH;
            imgOutput[(Row * width + Col) * channels + c] = (unsigned char)sum;
        }
    }
}