#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_cuda()
{
    // Use block and thread indices to manage work division
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Limit the number of greetings to one per thread
    if (idx == 0) {
        printf("Hello CUDA world \n");
    }
}