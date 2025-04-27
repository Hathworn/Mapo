#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use warp-level operations to optimize performance
    if (idx < arrayCount) {
        int val = array[idx];
        val *= val;
        array[idx] = val;
    }
}