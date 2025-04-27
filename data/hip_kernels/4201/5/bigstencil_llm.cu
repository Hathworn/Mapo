#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Optimize: Use shared memory for faster data access.
    __shared__ int shared_in[1024]; // Adjust size based on blockDim.x.
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory.
    shared_in[threadIdx.x] = in[i];
    __syncthreads(); // Ensure all data is loaded before proceeding.
    
    // Perform computation.
    // Use shared memory data for faster read.
    out[i] = shared_in[threadIdx.x] + 2;
}