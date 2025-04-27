#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Kernel(int* a, int* b, int* c, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory effectively to avoid bank conflicts and redundant writes
    __shared__ int shared_mem[BLOCK_SIZE];
    if (i >= n) return;
    
    // Load data into a register and shared memory
    int reg = a[i] + b[i];
    shared_mem[threadIdx.x] = reg;
    __syncthreads();

    // Write from shared memory to global memory
    c[i] = shared_mem[threadIdx.x];
}