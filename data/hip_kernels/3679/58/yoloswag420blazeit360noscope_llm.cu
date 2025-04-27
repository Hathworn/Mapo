#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID calculation for 1D grid
    if(id < size) 
    {
        float rand_val = rand[id]; // Load rand memory to register
        float input_val = input[id]; // Load input memory to register
        input[id] = (rand_val < prob) ? 0 : input_val * scale; // Perform computation and store
    }
}