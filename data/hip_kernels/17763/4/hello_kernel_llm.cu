#include "hip/hip_runtime.h"
#include "includes.h"

// Use a grid-stride loop to ensure all threads can execute printf if there are more threads than work items
__global__ void hello_kernel(void)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = idx; i < 1; i += stride) {
        printf("Hello, world from the device!\n");
    }
}