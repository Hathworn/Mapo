#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with check for valid thread index
__global__ void helloFromGPU()
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index

    if (idx == 0) // Only one thread prints the message
    {
        printf("Hello, World from GPU!\n");
    }
}