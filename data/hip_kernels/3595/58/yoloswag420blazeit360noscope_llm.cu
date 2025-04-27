#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Use blockDim.x and gridDim.x to calculate thread id more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x; 
    
    if(id < size) input[id] *= (rand[id] >= prob) * scale; // Use branchless condition
}