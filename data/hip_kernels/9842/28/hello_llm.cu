#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Pre-calculating the thread index for better readability
    int threadIndex = blockIdx.x; 

    // Utilizing printf efficiently by reducing function call overhead
    printf("Hello world! I'm a thread in block %d\n", threadIndex);
}