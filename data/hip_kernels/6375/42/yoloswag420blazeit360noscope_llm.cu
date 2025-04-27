#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block ID calculation assuming 1D grid
    if(id < size) {
        float random_value = rand[id];
        input[id] = (random_value < prob) ? 0.0f : input[id] * scale; // Use 0.0f for float literals
    }
}