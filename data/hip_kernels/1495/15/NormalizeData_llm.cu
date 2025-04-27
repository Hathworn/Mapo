#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void NormalizeData(float* ShiftData, float MaxValue, float MinValue, int FinalDataSize) {
    // Calculate global thread index more efficiently
    int id = blockIdx.x * blockDim.x * gridDim.y * gridDim.z + 
             blockIdx.y * blockDim.x * gridDim.z + 
             blockIdx.z * blockDim.x + 
             threadIdx.x;

    // Return early if out of bounds
    if (id >= FinalDataSize) return;

    // Normalize the data based on max/min value without printf for performance
    float value = ShiftData[id];
    if (value < MinValue) {
        ShiftData[id] = 0;
    } else if (value > MaxValue) {
        ShiftData[id] = 1;
    } else {
        ShiftData[id] = (value - MinValue) / (MaxValue - MinValue);
    }
}