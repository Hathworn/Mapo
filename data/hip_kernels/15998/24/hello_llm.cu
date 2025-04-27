```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Store thread ID in a local variable for reuse
    int tid = threadIdx.x;
    
    // Use a single printf to reduce IO overhead
    printf("Hello world! I'm thread %d\n", tid);
}