#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel launches with many threads can clutter output and cause performance issues;
// Use a single thread to demonstrate functionality.
__global__ void testKernel()
{
    if (threadIdx.x == 0 && blockIdx.x == 0) { // Only one thread in one block prints
        printf("hi!\n");
    }
}