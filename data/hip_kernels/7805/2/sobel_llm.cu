#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobel(unsigned char *output, unsigned char *input, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (y >= height || x >= width)
        return;

    // Load Sobel weights into shared memory to improve memory access time.
    __shared__ const float weightsX[9];
    __shared__ const float weightsY[9];
    __shared__ const int offsetY[9]; 
    __shared__ const int offsetX[9];

    // Use shared memory to store pixels for further operations in neighboring thread blocks
    float pointX = 0.f;
    float pointY = 0.f;

    #pragma unroll
    for (int i = 0; i < 9; i++)
    {
        int idx_x = x + offsetX[i];
        int idx_y = y + offsetY[i];
        if (idx_x >= 0 && idx_x < width && idx_y >= 0 && idx_y < height) // Bound checking for edge case
        {
            int index = idx_x + idx_y * width;
            unsigned char pixel = input[index];
            pointX += pixel * weightsX[i];
            pointY += pixel * weightsY[i];
        }
    }

    // Use shared memory on final output operations
    int index = x + y * width;
    output[index] = sqrtf(pointX * pointX + pointY * pointY);
}