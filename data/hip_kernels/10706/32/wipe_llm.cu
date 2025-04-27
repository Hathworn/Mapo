#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wipe(int *buffer, int length) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Global thread index
    int totalThreads = blockDim.x * gridDim.x;       // Total number of threads
    length >>= 5;
    for(int i = tid; i < length; i += totalThreads) { // Process data in parallel across threads
        buffer[(i << 5) + threadIdx.x] = -1;
    }
}