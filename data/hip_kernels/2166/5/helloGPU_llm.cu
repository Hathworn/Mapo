#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloGPU()
{
    // Use block and thread indices to reduce redundant prints
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        printf("Hello from the GPU.\n");
    }
}