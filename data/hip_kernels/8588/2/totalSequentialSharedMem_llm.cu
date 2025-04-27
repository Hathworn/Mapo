#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void totalSequentialSharedMem(float *input, float *output, int len) {
    // Calculate the global thread index
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Declare shared memory with the size of blockDim.x
    __shared__ float sdata[BLOCK_SIZE];
    
    // Load input elements into shared memory and handle bounds checking
    sdata[tid] = (i < len) ? input[i] : 0.0;

    // Synchronize threads within the block to ensure all data is loaded
    __syncthreads();

    // Perform the reduction within the shared memory
    // Use a loop with logarithmic steps to reduce the data 
    // Fewer memory accesses for improved performance
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        // Synchronize threads within the block after each step of reduction
        __syncthreads();
    }

    // Output the result to global memory
    // Only the first thread in the block writes the result
    if (tid == 0) {
        output[blockIdx.x] = sdata[0];
    }
}