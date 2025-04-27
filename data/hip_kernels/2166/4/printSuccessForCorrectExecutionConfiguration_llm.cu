#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void printSuccessForCorrectExecutionConfiguration()
{
    // Optimized to use block and thread index directly
    if (blockIdx.x == gridDim.x - 1 && threadIdx.x == blockDim.x - 1)
    {
        printf("Success!\n");
    }
}