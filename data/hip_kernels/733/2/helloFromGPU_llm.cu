```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Use a single thread to ensure only one printf execution
    if(threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World from GPU!\n");
    }
}