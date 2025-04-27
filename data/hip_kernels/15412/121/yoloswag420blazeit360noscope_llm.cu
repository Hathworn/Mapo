#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and thread synchronization
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
    int id = (blockIdx.x * blockDim.x) + threadIdx.x; // Simplified id calculation
    int stride = blockDim.x * gridDim.x; // Compute stride for full utilization

    // Loop over data with stride to handle large inputs
    for (int i = id; i < size; i += stride)
    {
        input[i] = (rand[i] < prob) ? 0 : input[i] * scale; // Conditional scaling
    }
}