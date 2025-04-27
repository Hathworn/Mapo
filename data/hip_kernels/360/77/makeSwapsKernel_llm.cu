#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeSwapsKernel(int size, int *partition, int *partSizes, int *nodeWeights, int *swap_to, int *swap_from, int *swap_index, float *desirability)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < size) 
    {
        // Simplifying condition checking
        bool valid_swap = (idx == size - 1) || (swap_from[idx] != swap_from[idx + 1]);
        
        if (desirability[idx] > 0.1 && valid_swap) 
        {
            int swapTo = swap_to[idx];
            int swapFrom = swap_from[idx];
            int swapIndex = swap_index[idx];
            int nodeWeight = nodeWeights[swapIndex];
            
            partition[swapIndex] = swapTo;
            atomicAdd(&partSizes[swapTo], nodeWeight);
            atomicAdd(&partSizes[swapFrom], -nodeWeight);
            
            // Debug print can be optionally enabled
            // printf("Swapping node: %d, %d from part: %d, %d to part: %d, %d desirability: %f\n", swapIndex, nodeWeight, swapFrom, partSizes[swapFrom], swapTo, partSizes[swapTo], desirability[idx]);
        }
    }
}