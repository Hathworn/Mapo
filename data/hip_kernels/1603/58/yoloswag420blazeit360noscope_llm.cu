#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread index calculation for 1D grid
    int stride = gridDim.x * blockDim.x;  // Calculate stride for loop unrolling 

    for(int i = id; i < size; i += stride) {  // Use loop unrolling for better performance
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale;
    }
}