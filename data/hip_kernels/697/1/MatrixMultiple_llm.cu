#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 32
#define TILE_HEIGHT 32
#define FSize 256
//void convolution(int *InputImage,int width,int height,int *filter,int filterWidth,,int padding,int *result);
using namespace std;

__global__ void MatrixMultiple(int *InputImage, int width, int height, int *filter, int filterWidth, int *featureMap)
{
    // Calculate global row and column index
    int Row = blockIdx.y * TILE_HEIGHT + threadIdx.y;
    int Col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    int value = 0;
    int featureMapWidth = width - filterWidth + 1;

    // Check if within boundaries
    if (Row < height - filterWidth + 1 && Col < width - filterWidth + 1)
    {
        // Convolution operation
        for (int i = 0; i < filterWidth; i++)
        {
            for (int j = 0; j < filterWidth; j++)
            {
                // Accumulate the values using the filter
                value += filter[i * filterWidth + j] * InputImage[(Row + i) * width + (Col + j)];
            }
        }
        // Assign computed value to featureMap
        featureMap[featureMapWidth * Row + Col] = value;
    }
}