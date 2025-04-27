#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_hello() {
    // Use thread 0 of block 0 to avoid excessive printing
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World from GPU!\n");
    }
}