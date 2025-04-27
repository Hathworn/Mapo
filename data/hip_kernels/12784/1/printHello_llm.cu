#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void printHello() {
    // Use blockIdx and threadIdx to ensure output from only one thread
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        printf("The Device says \"Hello World\"\n");
    }
}