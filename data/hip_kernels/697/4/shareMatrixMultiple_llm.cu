#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 32
#define TILE_HEIGHT 32
#define FSize 256
//void convolution(int *InputImage,int width,int height,int *filter,int filterWidth,,int padding,int *result);
using namespace std;

__global__ void shareMatrixMultiple(int *InputImage,int width,int height,int *filter,int filterWidth,int *featureMap)
{
    extern __shared__ int tileImage[];

    int Row = blockIdx.y * TILE_HEIGHT + threadIdx.y;
    int Col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    int shareWidth = TILE_WIDTH + filterWidth - 1;
    int value = 0;
    int featureMapWidth = width - filterWidth + 1;

    // Load tile into shared memory with boundary checks
    if (Row < height && Col < width)
        tileImage[threadIdx.y * shareWidth + threadIdx.x] = InputImage[Row * width + Col];
    
    if (threadIdx.x < filterWidth - 1 && Col + TILE_WIDTH < width)
        tileImage[threadIdx.y * shareWidth + threadIdx.x + TILE_WIDTH] = InputImage[Row * width + Col + TILE_WIDTH];
    
    if (threadIdx.y < filterWidth - 1 && Row + TILE_HEIGHT < height)
        tileImage[(threadIdx.y + TILE_HEIGHT) * shareWidth + threadIdx.x] = InputImage[(Row + TILE_HEIGHT) * width + Col];
    
    if (threadIdx.x < filterWidth - 1 && threadIdx.y < filterWidth - 1 
        && Col + TILE_WIDTH < width && Row + TILE_HEIGHT < height)
        tileImage[(threadIdx.y + TILE_HEIGHT) * shareWidth + threadIdx.x + TILE_WIDTH] = InputImage[(Row + TILE_HEIGHT) * width + Col + TILE_WIDTH];
    
    __syncthreads();

    // Perform convolution only within valid output bounds
    if(Row < featureMapWidth && Col < featureMapWidth)
    {
        for(int i = 0; i < filterWidth; i++)
        {
            for(int j = 0; j < filterWidth; j++)
            {
                value += filter[i * filterWidth + j] * tileImage[(threadIdx.y + i) * shareWidth + threadIdx.x + j];
            }
        }
        featureMap[featureMapWidth * Row + Col] = value;
    }
}