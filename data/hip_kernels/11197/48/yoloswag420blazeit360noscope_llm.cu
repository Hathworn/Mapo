#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop for larger arrays
    for(int i = id; i < size; i += blockDim.x * gridDim.x) {
        // Conditional operation on input
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale;
    }
}