#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Load thread index into a register for faster access
    int idx = threadIdx.x; 

    // Use printf within the kernel to display thread index
    printf("Hello world! I'm thread %d\n", idx);
}