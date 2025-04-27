#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcReluForwardGPU(float *in, float *out, int elements)
{
    // Calculate unique thread index using built-in variables
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread is within bounds
    if(id < elements) {
        // Use max function to simplify ReLU operation
        out[id] = fmaxf(in[id], 0.0f);
    }
}