#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Calculate global thread ID
    int global_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Using global thread ID for output
    printf("Hello world! I'm thread %d\n", global_id);
}