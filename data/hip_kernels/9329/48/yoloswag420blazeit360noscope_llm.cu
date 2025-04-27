#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify ID calculation (assuming 1D grid)
    if(id < size) {
        float rand_val = rand[id]; // Cache read value from global memory
        input[id] = (rand_val < prob) ? 0.0f : input[id] * scale; // Simplify ternary operation
    }
}