#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate unique global index for each thread
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check boundary condition 
    if (id < size) {
        // Apply conditional operation
        input[id] = (rand[id] < prob) ? 0 : input[id] * scale;
    }
}