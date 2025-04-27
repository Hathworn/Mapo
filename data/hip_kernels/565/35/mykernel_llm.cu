#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mykernel() {
    // Use thread synchronization to ensure ordered execution
    __syncthreads();
    
    // Check for a particular thread to output the message
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello world from device!\n");
    }
    
    __syncthreads();
} /* end kernel */