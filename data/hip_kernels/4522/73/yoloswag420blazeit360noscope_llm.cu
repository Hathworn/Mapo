#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify id calculation for 1D grid
    if(id < size) { // Use braces for better readability
        float randValue = rand[id]; // Cache rand[id] to reduce global memory access
        if(randValue >= prob) { // Compare once and scale if necessary
            input[id] *= scale;
        } else {
            input[id] = 0.0f; // Explicitly assign zero to improve clarity
        }
    }
}