#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelHelloWorld() {
    // Print from a single thread to avoid overloading stdout
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World!\n");
    }
}