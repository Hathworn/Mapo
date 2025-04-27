#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(void)
{
    // Use a smaller warp size for the condition to reduce divergence
    int idx = threadIdx.x;
    
    // Limit thread execution to only relevant threads
    if (idx < 32 && idx == 5)
    {
        printf("Hello World from GPU thread %d!\n", idx);
    }
}