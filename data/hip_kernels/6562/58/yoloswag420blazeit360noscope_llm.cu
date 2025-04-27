#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Flatten 1D block index
    if (id < size) {
        float rand_value = rand[id];
        float input_value = input[id];
        // Conditional assignment with ternary operator
        input[id] = rand_value < prob ? 0.0f : input_value * scale;
    }
}