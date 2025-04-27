#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Use threadIdx and blockIdx for potentially unique messages
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello World from GPU! My index is: %d\n", index);
}