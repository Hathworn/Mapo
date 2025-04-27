#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void NormalizeData(float* ShiftData, float MaxValue, float MinValue, int FinalDataSize)
{
    // Simplified thread index calculation for efficiency
    int id = blockIdx.x * blockDim.x + threadIdx.x 
           + blockIdx.y * gridDim.x * blockDim.x 
           + blockIdx.z * gridDim.x * gridDim.y * blockDim.x;

    // Optimized bounds checking
    if (id >= FinalDataSize) return;

    // Optimized normalization logic without branching
    float value = ShiftData[id];
    ShiftData[id] = value < MinValue ? 0 : (value > MaxValue ? 1 : (value - MinValue) / (MaxValue - MinValue));
}