#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void printSuccessForCorrectExecutionConfiguration()
{
    // Use more dynamic and less conditional print for efficiency
    printf(threadIdx.x == blockDim.x - 1 && blockIdx.x == gridDim.x - 1 ? "Success!\n" : "Failure. Update the execution configuration as necessary.\n");
}