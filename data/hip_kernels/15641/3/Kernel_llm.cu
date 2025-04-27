#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Kernel(int* a, int* b, int* c, int n) {

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory efficiently with a fixed size
    __shared__ int shared_mem[blockDim.x];
    int reg;

    if (i >= n) return;

    // Load data into registers directly
    reg = a[i] + b[i];
    
    // Store results in shared memory only limited to active threads
    shared_mem[threadIdx.x] = reg;
    __syncthreads();

    // Write back results to global memory
    c[i] = shared_mem[threadIdx.x];
}