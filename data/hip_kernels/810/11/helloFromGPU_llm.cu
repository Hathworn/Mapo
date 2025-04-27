#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Launch the kernel with a single thread.
    // This avoids unnecessary blocks and threads.
    if (threadIdx.x == 0 && blockIdx.x == 0)
    {
        printf("Hello World from GPU!\n");
    }
}