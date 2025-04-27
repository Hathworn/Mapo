#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sobelEdgeDetectionSharedMem(int *input, int *output, int width, int height, int thresh) {

    const int blockSize = 32;
    __shared__ int shMem[34][34];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i >= width || j >= height) return; // Boundary check

    int index = j * width + i;

    int xind = threadIdx.x + 1;
    int yind = threadIdx.y + 1;

    // Load the central tile
    shMem[xind][yind] = input[index];

    // Load the halo elements
    if (threadIdx.x == 0 && i > 0)
        shMem[xind - 1][yind] = input[width * j + i - 1];
    if (threadIdx.y == 0 && j > 0)
        shMem[xind][yind - 1] = input[width * (j - 1) + i];
    if (threadIdx.x == blockDim.x - 1 && i < width - 1)
        shMem[xind + 1][yind] = input[width * j + i + 1];
    if (threadIdx.y == blockDim.y - 1 && j < height - 1)
        shMem[xind][yind + 1] = input[width * (j + 1) + i];

    // Load the corner elements
    if (threadIdx.x == 0 && threadIdx.y == 0 && i > 0 && j > 0)
        shMem[xind - 1][yind - 1] = input[width * (j - 1) + i - 1];
    if (threadIdx.x == blockDim.x - 1 && threadIdx.y == 0 && i < width - 1 && j > 0)
        shMem[xind + 1][yind - 1] = input[width * (j - 1) + i + 1];
    if (threadIdx.x == 0 && threadIdx.y == blockDim.y - 1 && i > 0 && j < height - 1)
        shMem[xind - 1][yind + 1] = input[width * (j + 1) + i - 1];
    if (threadIdx.x == blockDim.x - 1 && threadIdx.y == blockDim.y - 1 && i < width - 1 && j < height - 1)
        shMem[xind + 1][yind + 1] = input[width * (j + 1) + i + 1];

    __syncthreads();

    if (i > 0 && j > 0 && i < width - 1 && j < height - 1) {
        int sum1 = 0, sum2 = 0, magnitude;

        sum1 = shMem[xind + 1][yind - 1] - shMem[xind - 1][yind - 1]
            + 2 * shMem[xind + 1][yind] - 2 * shMem[xind - 1][yind]
            + shMem[xind + 1][yind + 1] - shMem[xind - 1][yind + 1];

        sum2 = shMem[xind - 1][yind - 1] + 2 * shMem[xind][yind - 1] + shMem[xind + 1][yind - 1]
            - shMem[xind - 1][yind + 1] - 2 * shMem[xind][yind + 1] - shMem[xind + 1][yind + 1];

        magnitude = sum1 * sum1 + sum2 * sum2;
        output[index] = (magnitude > thresh) ? 255 : 0;
    }
}