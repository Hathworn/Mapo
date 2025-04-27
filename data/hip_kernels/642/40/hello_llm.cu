#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void hello()
{
    int idx = threadIdx.x; // Cache thread index to a local variable for potential compiler optimization
    printf("Hello world! I'm thread %d\n", idx);
}