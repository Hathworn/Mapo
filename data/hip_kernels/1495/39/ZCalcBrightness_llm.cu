#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ZCalcBrightness(float* DataArray, float* BrightArray, int size, int rows, int cols, int startIndex)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size * rows)  // Check bounds
        return;

    // Calculate Index
    int sizeIndex = id / rows;
    int rowIndex = id % rows;

    float sum = 0.0f;  // Use a local variable to reduce global memory access
    for (int i = startIndex; i < cols; i++)
    {
        int currentID = sizeIndex * rows * cols + rowIndex * cols + i;
        sum += DataArray[currentID];  // Accumulate results in the local variable
    }
    BrightArray[id] = sum;  // Store the final result to global memory
}