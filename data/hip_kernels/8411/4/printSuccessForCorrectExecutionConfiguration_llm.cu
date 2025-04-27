#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void printSuccessForCorrectExecutionConfiguration()
{
    // Use less expensive Warp function for condition
    if(threadIdx.x == blockDim.x - 1 && blockIdx.x == gridDim.x - 1)
    {
        printf("Success!\n");
    }
}