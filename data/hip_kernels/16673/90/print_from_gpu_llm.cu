#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void print_from_gpu(void) {
    // Use block and thread id for unique message
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello World! from thread %d \
From device\n", tid);
}