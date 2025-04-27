#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void childKernel(unsigned int parentThreadIndex, float* data)
{
    // Using a register variable for thread index to avoid multiple memory accesses
    unsigned int tid = threadIdx.x;
    
    // Minimize printf calls for better performance
    if (tid == 0) {
        printf("Parent thread index: %d\n", parentThreadIndex);
    }
    
    // Perform computation and data storage
    data[tid] = parentThreadIndex + 0.1f * tid;
}