#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu()
{
    // Use a single thread to reduce redundant printf calls
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World from the GPU!\n");
    }
}