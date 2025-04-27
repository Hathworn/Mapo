#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void HelloFromGPU(void)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    
    if (idx == 0) // Ensure message is printed only once
    {
        printf("Hello World From GPU!\n");
    }
}