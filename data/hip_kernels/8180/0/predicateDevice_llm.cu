#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int function(int value , int bit , int bitset)
{
    // Simplified conditional logic
    return (bitset == 1) ? ((value & bit) != 0) : ((value & bit) == 0);
}

__global__ void predicateDevice(int *d_array, int *d_predicateArrry, int d_numberOfElements, int bit, int bitset)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    // Use branchless assignment for improved performance
    if (index < d_numberOfElements)
    {
        d_predicateArrry[index] = function(d_array[index], bit, bitset);
    }
}