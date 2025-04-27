#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void meanFilter(unsigned char *input, unsigned char *output, int height, int width)
{
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int row = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure thread operates within image boundary
    if (row < height && col < width)
    {
        int pixelIndex = row * width + col;
        int pixelNum = 0;
        int tempSum = 0;

        // Utilize shared memory for faster access within blocks
        __shared__ unsigned char tile[BLOCK_SIZE + FILTER_SIZE - 1][BLOCK_SIZE + FILTER_SIZE - 1];

        // Calculate global index and shared memory index
        int tileRow = threadIdx.y + FILTER_SIZE / 2;
        int tileCol = threadIdx.x + FILTER_SIZE / 2;

        // Load data into shared memory
        tile[tileRow][tileCol] = input[row * width + col];
        __syncthreads();

        // Compute mean using shared memory
        for (int i = -FILTER_SIZE / 2; i <= FILTER_SIZE / 2; i++)
        {
            for (int j = -FILTER_SIZE / 2; j <= FILTER_SIZE / 2; j++)
            {
                int sharedRow = tileRow + j;
                int sharedCol = tileCol + i;
                
                if (sharedCol >= 0 && sharedCol < BLOCK_SIZE + FILTER_SIZE - 1 && sharedRow >= 0 && sharedRow < BLOCK_SIZE + FILTER_SIZE - 1)
                {
                    tempSum += tile[sharedRow][sharedCol];
                    pixelNum++;
                }
            }
        }

        // Assign mean value to output
        output[pixelIndex] = tempSum / pixelNum;
    }
}