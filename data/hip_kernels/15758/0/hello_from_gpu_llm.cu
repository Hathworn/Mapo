#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu()
{
    // Use thread index to distribute work across threads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        printf("Hello World from the GPU!\n");
    }
}