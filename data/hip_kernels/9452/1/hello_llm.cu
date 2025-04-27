#include "hip/hip_runtime.h"
#include "includes.h"

// Block index Printf (Rodrigo)

#define NUM_BLOCKS 16
#define BLOCK_WIDTH 1

__global__ void hello()
{
    int threadId = threadIdx.x; // Cache thread index in register
    printf("Hello world! I'm thread %d\n", threadId);
}