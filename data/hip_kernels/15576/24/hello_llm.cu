#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello()
{
    int tid = threadIdx.x; // Cache thread index
    printf("Hello world! I'm thread %d\n", tid);
}