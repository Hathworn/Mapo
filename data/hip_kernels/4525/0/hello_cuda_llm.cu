#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_cuda()
{
    // Use thread and block indices for potential expanded functionality 
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Print from a single, identifiable thread to reduce output clutter
    if (idx == 0) {
        printf("Hello Cuda\n");
    }
}