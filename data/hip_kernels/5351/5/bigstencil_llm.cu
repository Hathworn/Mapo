#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for better memory access efficiency
    __shared__ int shared_in[256];  // Adjust size as needed based on blockDim.x
    shared_in[threadIdx.x] = in[i];

    __syncthreads();  // Ensure all threads have loaded data into shared memory

    // Perform computation
    out[i] = shared_in[threadIdx.x] + 2;
}