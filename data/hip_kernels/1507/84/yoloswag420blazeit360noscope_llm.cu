#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we only process valid ID within bounds
    if(id < size) {
        // Use ternary operation for conditional assignment
        input[id] = (rand[id] < prob) ? 0.0f : input[id] * scale;
    }
}