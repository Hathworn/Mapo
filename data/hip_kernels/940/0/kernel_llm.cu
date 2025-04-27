#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(void) {
    // Prevent infinite loop to avoid GPU hang
    __shared__ int counter; // Use shared memory for thread cooperation
    if (threadIdx.x == 0) {
        counter = 0;
    }
    __syncthreads();
    while (atomicAdd(&counter, 1) < gridDim.x * blockDim.x) {
        // Perform limited iterations
    }
}