#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelEdgeDetection(int *input, int *output, int width, int height, int thresh) {

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int index = j * width + i;

    if (i > 0 && j > 0 && i < width - 1 && j < height - 1) {

        int sx = input[(j - 1) * width + (i + 1)] - input[(j - 1) * width + (i - 1)]
                 + 2 * input[j * width + (i + 1)] - 2 * input[j * width + (i - 1)]
                 + input[(j + 1) * width + (i + 1)] - input[(j + 1) * width + (i - 1)];

        int sy = input[(j - 1) * width + (i - 1)] + 2 * input[(j - 1) * width + i] + input[(j - 1) * width + (i + 1)]
                 - input[(j + 1) * width + (i - 1)] - 2 * input[(j + 1) * width + i] - input[(j + 1) * width + (i + 1)];

        int magnitude = sx * sx + sy * sy;

        // Use ternary operator for concise assignment
        output[index] = (magnitude > thresh) ? 255 : 0;
    }
}