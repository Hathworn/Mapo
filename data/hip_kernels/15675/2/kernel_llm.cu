#include "hip/hip_runtime.h"
#include "includes.h"

// Use __device__ function to minimize kernel overhead
__device__ void printHello() {
    printf("hello world");
}

__global__ void kernel() {
    // Launch kernel for each thread block
    if (threadIdx.x == 0 && blockIdx.x == 0) { // Reduce unnecessary prints
        printHello();
    }
}