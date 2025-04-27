#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified block index calculation
    if (id < size) {
        float randomValue = rand[id];  // Cache rand[id] in a register to reduce memory access
        input[id] = (randomValue < prob) ? 0 : input[id] * scale;  // Use cached randomValue
    }
}