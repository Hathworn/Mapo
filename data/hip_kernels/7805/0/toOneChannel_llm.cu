#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void toOneChannel(unsigned char *data, int width, int height, int components)
{
    // Calculate flattened index for the current thread
    int index = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x + threadIdx.y * width + threadIdx.x;

    // Calculate column and row based on the index
    int column = index % width;
    int row = index / width;

    // Return if the current position is out of bounds
    if (row >= height || column >= width)
        return;

    unsigned char *threadData = data + (components * index);

    for (int i = 0; i < components - 1; i++)
    {
        threadData[i] = 0;
    }
}