#include "hip/hip_runtime.h"
#include "includes.h"

#define UNROLL_FACTOR 4  // define unroll factor

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    int id_end = size - id; // calculate remaining threads
    int unroll_limit = id_end < blockDim.x*UNROLL_FACTOR ? id_end : blockDim.x*UNROLL_FACTOR; // limit unrolling to remaining size

    // Unrolling loop
    for (int i = 0; i < unroll_limit; i += blockDim.x)
    {
        int idx = id + i;
        if (idx < size) 
        {
            input[idx] = (rand[idx] < prob) ? 0 : input[idx]*scale;
        }
    }
}