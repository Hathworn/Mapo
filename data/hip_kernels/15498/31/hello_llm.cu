#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Load thread index into a register for efficient access
    int tid = threadIdx.x;
    
    // Unroll loop if needed for repetitive operations (if applicable, here just a single printf)
    printf("Hello world! I'm thread %d\n", tid);
}