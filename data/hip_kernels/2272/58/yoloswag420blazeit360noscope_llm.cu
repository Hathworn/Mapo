#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using grid-stride loop for better memory access and parallelism
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Grid-stride loop
    for (int i = id; i < size; i += blockDim.x * gridDim.x) {
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale;
    }
}