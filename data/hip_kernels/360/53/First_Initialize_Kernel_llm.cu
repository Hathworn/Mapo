#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void First_Initialize_Kernel(int size, unsigned int *randoms, int *bestSeen, int *origin)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a grid-stride loop to handle more elements efficiently
    for (int i = idx; i < size; i += blockDim.x * gridDim.x) 
    {
        // Set the origin to be self
        origin[i] = i;

        // Set the bestSeen value to be random
        bestSeen[i] = randoms[i] % 1000000;
    }
}