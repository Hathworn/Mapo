#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel() {
    // Use thread and block IDs for potential parallel work distribution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Ensure only one thread prints
        printf("Hello, world!\n");
    }
}