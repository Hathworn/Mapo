#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float activateRandomly(float probability, float random)
{
    return random < probability;
}

__global__ void RBMRandomActivationKernel(float *outputPtr, float *randomPtr, int size)
{
    // Calculate flattened index using grid-stride loop
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; 

    for (; i < size; i += stride)
    {
        outputPtr[i] = activateRandomly(outputPtr[i], randomPtr[i]);
    }
}