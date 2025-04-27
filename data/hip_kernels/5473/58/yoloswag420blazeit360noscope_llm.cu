#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    // Loop unrolling for better performance in case of large data size
    for (; id < size; id += gridSize) {
        input[id] = (rand[id] < prob) ? 0 : input[id] * scale;
    }
}