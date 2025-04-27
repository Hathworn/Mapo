#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize block index calculation for 1D grid
    int stride = blockDim.x * gridDim.x;  // Calculate stride for next elements

    for (int i = id; i < size; i += stride) {  // Loop to process all elements
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale;  // Conditional scaling
    }
}