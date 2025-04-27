#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelEdgeDetectionWithRegisters(int *input, int *output, int width, int height, int thresh) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure that the thread is within the image boundaries
    if (i > 0 && i < width - 1 && j > 0 && j < height - 1) {
        int index = j * width + i;

        // Use registers to store pixel values
        int left = input[width * j + (i - 1)];
        int right = input[width * j + (i + 1)];
        int top = input[width * (j - 1) + i];
        int bottom = input[width * (j + 1) + i];

        int val1 = input[width * (j - 1) + (i + 1)];
        int val2 = input[width * (j - 1) + (i - 1)];
        int val3 = input[width * (j + 1) + (i + 1)];
        int val4 = input[width * (j + 1) + (i - 1)];

        int sum1 = val1 - val2 + 2 * right - 2 * left + val3 - val4;
        int sum2 = val2 + 2 * top + val1 - val4 - 2 * bottom - val3;

        int magnitude = sum1 * sum1 + sum2 * sum2;
        output[index] = (magnitude > thresh) ? 255 : 0;
    } else if (i < width && j < height) {
        // For threads on the border, ensure output is set
        int index = j * width + i;
        output[index] = 0;
    }
}