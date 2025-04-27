#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello() {
    // Use a single thread to print message to avoid concurrency issues
    if (threadIdx.x == 0) {
        printf("Hello world! I'm a thread in block %d\n", blockIdx.x);
    }
}