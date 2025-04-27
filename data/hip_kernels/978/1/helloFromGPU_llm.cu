#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to print from a specific thread
__global__ void helloFromGPU(void)
{
    // Use a single if statement with a return to optimize performance
    if (threadIdx.x != 5) return;
    printf("Hello World from GPU thread %d!\n", threadIdx.x);
}