#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Load thread index into a register to minimize repeated memory accesses
    int tid = threadIdx.x;

    // Reduce the frequency of printf by using a conditional statement
    if (tid < 32)  // Example: only first warp will print
    {
        printf("Hello world! I'm thread %d\n", tid);
    }
}