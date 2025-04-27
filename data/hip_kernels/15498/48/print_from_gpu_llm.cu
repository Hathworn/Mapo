#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_from_gpu(void) {
    // Use registers to reduce memory access and improve performance
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    printf("Hello World! from thread [%d,%d] From device\n", tx, bx);
}