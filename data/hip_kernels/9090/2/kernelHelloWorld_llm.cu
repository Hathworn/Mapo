#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelHelloWorld() {
    // Combine block and thread index for global thread index
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;

    printf("Hello World from global thread ID %d, thread %d of block %d!\n", globalThreadId, threadIdx.x, blockIdx.x);
}