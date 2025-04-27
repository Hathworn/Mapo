#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void removeRuntyPartsKernel(int size, int *partition, int *removeStencil, int *subtractions)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size)
    {
        int currentNode = partition[idx];
        // Using a ternary operator for branchless optimization
        partition[idx] = (removeStencil[currentNode] == 1) ? -1 : partition[idx] - subtractions[currentNode];
    }
}