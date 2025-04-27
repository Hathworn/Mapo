#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate global thread ID more clearly
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to handle larger data sizes efficiently
    for (; id < size; id += blockDim.x * gridDim.x) {
        input[id] = (rand[id] < prob) ? 0 : input[id] * scale;
    }
}