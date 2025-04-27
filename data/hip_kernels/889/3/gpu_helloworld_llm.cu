#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_helloworld()
{
    // Cache thread index to a register for faster access
    int threadId = threadIdx.x;
    
    // Use more efficient printf
    printf("Hello from the GPU! My threadId is %d\n", threadId);
}