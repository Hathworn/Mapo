```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void print_from_gpu(void) {
    // Combine blockIdx and threadIdx to reduce register usage
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    printf("Hello World! from thread [%d] From device\n", tid);
}