#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Improved calculation of unique thread ID for better readability
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread ID is within bounds before performing operations
    if (id < size) {
        input[id] = (rand[id] < prob) ? 0 : input[id] * scale;
    }
}