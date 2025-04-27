#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelVacio(void) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int bDim = blockDim.x;

    // Reduced the condition to minimize thread divergence
    if (tid < 10) {
        printf("Data: %s Id Thread: %d Id block: %d Num threads block: %d\n", "helloWorld!", tid, bid, bDim);
    }
}