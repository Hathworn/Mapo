#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to optimize memory access
    __shared__ int sharedMem[256];
    
    // Load elements into shared memory
    sharedMem[threadIdx.x] = in[i];
    __syncthreads();
    
    // Perform computation using shared memory
    out[i] = sharedMem[threadIdx.x] + 2;
}