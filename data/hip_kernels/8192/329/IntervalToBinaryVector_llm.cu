#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IntervalToBinaryVector(float input, float* outputs, int steps)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (id < steps)
    {
        float fraction = 1.0f / steps;
        // Optimized condition check with enhanced readability
        outputs[id] = (input >= id * fraction) && (input < (id + 1) * fraction);
    }
}