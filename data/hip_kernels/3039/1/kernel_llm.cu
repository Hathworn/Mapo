#include "hip/hip_runtime.h"
#include "includes.h"

// Define maximum number of simultaneous threads to reduce serialization.
#define MAX_THREADS_PER_BLOCK 256

__global__ void kernel(void) {
    // Use minimized index calculations and reduce print frequency to lessen I/O overhead.
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Conditional statement to limit excessive printing.
    if (globalIndex % MAX_THREADS_PER_BLOCK == 0) {
        printf("GPU bockIdx %i threadIdx %i: Hello World!\n", blockIdx.x, threadIdx.x);
    }
}