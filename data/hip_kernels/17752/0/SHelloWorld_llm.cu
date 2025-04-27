#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SHelloWorld()
{
    // Calculate global thread index for better control
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("SubHelloWorld from %d-%d\n", blockIdx.x, globalIdx);
}