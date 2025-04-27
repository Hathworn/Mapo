#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to avoid using printf
__global__ void mykernel() {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique thread index
    if (idx == 0) {  // Use single thread to output message
        printf("Hello world from device!\n");
    }
} /* end kernel */