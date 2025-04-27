#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Use thread 0 in block 0 to print to avoid redundant outputs
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World from GPU!\n");
    }
}