#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IntervalToBinaryVector(float input, float* outputs, int steps)
{
    // Calculate unique global thread ID directly
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Use if statement only if id is within range
    if (id < steps)
    {
        // Precompute fraction multiplication for efficiency
        float fraction = 1.0f / steps;
        float lower_bound = fraction * id;
        float upper_bound = fraction * (id + 1);

        // Store result in outputs array
        outputs[id] = (input >= lower_bound && input <= upper_bound);
    }
}