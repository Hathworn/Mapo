#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate global thread ID with optimizations
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds and perform operation
    if(id < size) {
        float rnd = rand[id];
        float inp = input[id];
        input[id] = (rnd < prob) ? 0.0f : inp * scale;  // Use temporary variables for better readability
    }
}