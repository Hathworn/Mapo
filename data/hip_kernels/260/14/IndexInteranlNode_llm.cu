#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IndexInternalNode(bool *forest, int base, int step)
{
    // Calculate the offset based on block and thread indices once
    int offset = blockIdx.x * step;
    int left  = 2 * (base + threadIdx.x) + offset;
    int right = left + 1;

    // Move offset addition out of individual calculations
    forest[left / 2] = forest[left] && forest[right];
}