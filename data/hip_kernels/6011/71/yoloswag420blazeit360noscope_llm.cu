#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Optimize index calculation by removing repeated operations
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if(id < size) {
        // Use conditional operator directly in assignment
        input[id] *= (rand[id] >= prob) ? scale : 0;
    }
}