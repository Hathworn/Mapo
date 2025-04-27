#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use shared memory to store the results temporarily
    extern __shared__ int shared_mem[];
    int tid = threadIdx.x;
    
    // Single thread performs addition, optimized for future use of more threads
    if (tid == 0) {
        shared_mem[0] = a + b;
    }
    __syncthreads();
    
    // Copy result from shared memory to global memory
    if (tid == 0) {
        *c = shared_mem[0];
    }
}