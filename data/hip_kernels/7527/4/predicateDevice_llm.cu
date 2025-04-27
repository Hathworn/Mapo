#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void predicateDevice(int *d_array, int *d_predicateArrry, int d_numberOfElements, int bit, int bitset)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < d_numberOfElements)
    {
        // Use ternary operator for concise conditionals
        d_predicateArrry[index] = ((d_array[index] & bit) == 0) ? (bitset == 0) : (bitset != 0);
    }
}