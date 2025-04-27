#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getInversePermutationKernel(int size, int *original, int *inverse)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if(idx < size)
    {
        // Use atomic operation to prevent data races
        atomicExch(&inverse[original[idx]], idx);
    }
}