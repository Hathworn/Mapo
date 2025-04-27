#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = blockDim.x * gridDim.x; // Calculate grid stride
    for (; id < size; id += stride) { // Loop with grid stride
        input[id] = (rand[id] < prob) ? 0 : input[id] * scale; // Perform conditional operation
    }
}