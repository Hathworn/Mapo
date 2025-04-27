#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid
    for (int i = id; i < size; i += stride) { // Loop with stride for data parallelism
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale; // Apply transformation
    }
}