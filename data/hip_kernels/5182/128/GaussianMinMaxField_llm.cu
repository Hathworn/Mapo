#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void GaussianMinMaxField(float* input, int inputCount, float* mins, float* maxes)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (i < inputCount) // Boundary check
    {
        float value = input[i]; // Load input value to register to avoid multiple reads
        atomicMin(&mins[i], value); // Use atomic operations for min
        atomicMax(&maxes[i], value); // Use atomic operations for max
    }
}