#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobel(unsigned char *output, unsigned char *input, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (y >= height || x >= width)
        return;

    const int BLOCK_SIZE = 16;

    // Shared Data with boundary padding
    __shared__ unsigned char pixels[BLOCK_SIZE + 2][BLOCK_SIZE + 2];

    // Linear index for loading into shared memory
    int threadIndex = threadIdx.x + threadIdx.y * blockDim.x;
    int loadX = threadIndex % (BLOCK_SIZE + 2);
    int loadY = threadIndex / (BLOCK_SIZE + 2);

    // Load data into shared memory
    if (loadY < BLOCK_SIZE + 2 && loadX < BLOCK_SIZE + 2) {
        int globalX = blockIdx.x * blockDim.x + loadX - 1;
        int globalY = blockIdx.y * blockDim.y + loadY - 1;

        // Clamp global indices
        globalX = max(0, min(globalX, width - 1));
        globalY = max(0, min(globalY, height - 1));

        pixels[loadY][loadX] = input[globalY * width + globalX];
    }
    __syncthreads();

    // Sobel weights
    float weightsX[3][3] = { {-1, -2, -1}, {0, 0, 0}, {1, 2, 1} };
    float weightsY[3][3] = { {-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1} };

    float pointX = 0.f;
    float pointY = 0.f;

    // Compute Sobel filter
    #pragma unroll
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            int indexX = threadIdx.x + 1 + j;
            int indexY = threadIdx.y + 1 + i;
            unsigned char pixel = pixels[indexY][indexX];
            pointX += pixel * weightsX[i][j];
            pointY += pixel * weightsY[i][j];
        }
    }

    // Write output
    int index = x + y * width;
    if (x < width && y < height) {
        output[index] = sqrtf(pointX * pointX + pointY * pointY);
    }
}