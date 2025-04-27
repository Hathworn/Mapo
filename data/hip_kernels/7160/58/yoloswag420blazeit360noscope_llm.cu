#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate unique global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Optimize the boundary check and operation
    if (id < size) {
        float random_value = rand[id]; // Reduce global memory access latency
        float input_value = input[id];
        input[id] = (random_value < prob) ? 0.0f : input_value * scale;
    }
}