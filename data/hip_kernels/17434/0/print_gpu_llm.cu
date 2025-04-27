#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_gpu(void) {
    // Improved string formatting for readability and thread-based identification
    printf("Houston, we have a problem in section [thread: %d, block: %d] from Apollo 13\n", threadIdx.x, blockIdx.x);
}