#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Kernel Function
__global__ void hello_from_gpu()
{
    // Utilize block and thread indices for scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Condition to limit excessive print in larger configurations
    if(idx == 0)
    {
        printf("Hello World from the GPU!\n");
    }
}