#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(void)
{
    // Optimizing to use the warp for efficient execution
    if (threadIdx.x == 5 && threadIdx.y == 0 && threadIdx.z == 0)
    {
        printf("Hello World from GPU thread %d!\n", threadIdx.x);
    }
}