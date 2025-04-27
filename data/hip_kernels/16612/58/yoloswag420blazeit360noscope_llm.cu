#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of `id`
    
    // Use a grid-stride loop to handle larger arrays
    for (int i = id; i < size; i += blockDim.x * gridDim.x) {
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale; // Apply operation
    }
}