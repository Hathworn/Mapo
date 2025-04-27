#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Use one-dimensional grid and block index calculation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Print message with unique thread identifier
    printf("Hello from GPU! UniqueThreadID: %d.\n", idx);
}