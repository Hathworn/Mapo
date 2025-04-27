#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block index calculation
    if (id < size) {
        float r = rand[id]; // Cache rand value to avoid repeated global memory access
        input[id] = (r < prob) ? 0.0f : input[id] * scale;
    }
}