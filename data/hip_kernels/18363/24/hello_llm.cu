#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Optimize I/O by minimizing printf usage in the kernel
    int tid = threadIdx.x; // Cache thread index to register
    if (tid < 32) {        // Limit output to the first 32 threads for efficiency
        printf("Hello world! I'm thread %d\n", tid);
    }
}