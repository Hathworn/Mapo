#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use local variables to cache block and thread indices for improved readability
    int block_id = blockIdx.x;
    int thread_id = threadIdx.x;

    // Use formatted string and separate print calls for efficiency
    printf("Hello world! ");
    printf("blockid: %d\n", block_id);
    printf("threadid: %d\n", thread_id);
}