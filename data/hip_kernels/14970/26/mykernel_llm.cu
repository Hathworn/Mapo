#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mykernel(){
    // Optimize by reducing I/O operations inside the kernel
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;
    if (threadId == 0) { // Print once from a single thread
        printf("Hello world from device!\n");
    }
} /* end kernel */