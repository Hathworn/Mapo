#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelVacio( void ) {
    // Ensure only threads with threadIdx.x < 10 proceed
    if (threadIdx.x < 10) {
        // Using __syncthreads() for better synchronization control
        __syncthreads();
        printf("Data: %s Id Thread: %d Id block : %d Num threads block : %d\n", "helloWorld!", threadIdx.x, blockIdx.x, blockDim.x);
    }
}