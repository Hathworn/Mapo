#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float activateRandomly(float probability, float random)
{
    return random < probability;
}

__global__ void RBMRandomActivationKernel(float *outputPtr, float *randomPtr, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid layout
    
    if (i < size)
    {
        outputPtr[i] = activateRandomly(outputPtr[i], randomPtr[i]);
    }
}