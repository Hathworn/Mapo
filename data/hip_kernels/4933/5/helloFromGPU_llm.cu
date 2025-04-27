#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(void)
{
    // Use one thread per block to reduce redundant printing
    if (threadIdx.x == 0 && blockIdx.x == 0) 
    {
        printf("Hello from GPU.\n");
    }
}