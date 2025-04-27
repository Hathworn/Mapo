```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void predicate(int *d_array, int d_numberOfElements, int *d_predicateArray)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use warp-level operations to optimize memory access
    if (index < d_numberOfElements)
    {
        int isDivisible = (d_array[index] % 32 == 0);
        d_predicateArray[index] = isDivisible;
    }
}