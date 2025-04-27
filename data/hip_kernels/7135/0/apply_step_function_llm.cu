#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float step_function(float v) // Sigmoid function::Activation Function
{
    return 1 / (1 + exp(-v));
}

__global__ void apply_step_function(float *input, float *output, const int N)
{
    // Calculate the global index of the thread
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (idx < N) {
        output[idx] = step_function(input[idx]); // Apply step function to each element
    }
}