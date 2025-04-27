#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void GaussianMinMaxField(float* input, int inputCount, float* mins, float* maxes)
{
    // Calculate global index in a more straightforward way
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within input bounds
    if (i < inputCount)
    {
        float inputValue = input[i]; // Load input once to reduce global memory access
        atomicMin(&mins[i], inputValue); // Use atomic operations to safely handle concurrent writes
        atomicMax(&maxes[i], inputValue);
    }
}