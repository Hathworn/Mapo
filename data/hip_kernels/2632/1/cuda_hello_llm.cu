#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_hello() {
    // Each thread prints a message. Use a single thread to avoid redundant prints.
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World from GPU!\n");
    }
}