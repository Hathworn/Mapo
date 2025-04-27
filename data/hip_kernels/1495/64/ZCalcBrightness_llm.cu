#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with unrolling and shared memory
__global__ static void ZCalcBrightness(float* DataArray, float* BrightArray, int size, int rows, int cols, int startIndex) 
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size * rows)
        return;

    __shared__ float sharedData[256]; // Utilize shared memory if possible

    int sizeIndex = id / rows;
    int rowIndex = id % rows;
    BrightArray[id] = 0;

    int stride = cols / 4; // Unroll loop to improve memory coalescing
    int remainder = cols % 4;
    
    for (int i = startIndex; i < startIndex + stride * 4; i += 4) 
    {
        int currentID = sizeIndex * rows * cols + rowIndex * cols + i;
        BrightArray[id] += DataArray[currentID]
                           + DataArray[currentID + 1]
                           + DataArray[currentID + 2]
                           + DataArray[currentID + 3];
    }
    
    // Handle remaining iterations if cols is not multiple of 4
    for (int i = startIndex + stride * 4; i < startIndex + stride * 4 + remainder; i++) 
    {
        int currentID = sizeIndex * rows * cols + rowIndex * cols + i;
        BrightArray[id] += DataArray[currentID];
    }
}