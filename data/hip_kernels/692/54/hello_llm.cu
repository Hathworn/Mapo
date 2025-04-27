#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello() {
    // Optimize by using shared memory initialization
    __shared__ char message[50];
    if (threadIdx.x == 0) {
        snprintf(message, sizeof(message), "Hello world! I'm a thread in block %d\n", blockIdx.x);
    }
    __syncthreads(); // Ensure all threads see the initialized message
    printf("%s", message); // Each thread prints the same message
}