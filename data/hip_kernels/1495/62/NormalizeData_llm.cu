#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void NormalizeData(float* ShiftData, float MaxValue, float MinValue, int FinalDataSize)
{
    // Calculate unique global thread ID in a simplified and performant way
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             blockIdx.y * blockDim.x * gridDim.x +
             blockIdx.z * blockDim.x * gridDim.x * gridDim.y;

    // Early exit if ID is out of bounds
    if (id >= FinalDataSize) return;

    // Simplifying normalization condition checks with ternary operator
    ShiftData[id] = (ShiftData[id] < MinValue) ? 0.0f : 
                    (ShiftData[id] > MaxValue) ? 1.0f :
                    (ShiftData[id] - MinValue) / (MaxValue - MinValue);
}