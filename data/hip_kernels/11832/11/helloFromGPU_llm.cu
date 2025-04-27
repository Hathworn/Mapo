```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Load thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure only one thread executes the print statement
    if (tid == 0) {
        printf("Hello World from GPU!\n");
    }
}