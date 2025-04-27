#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swap(unsigned short *d_input, float *d_output, int nchans, int nsamp) {
    // Compute the linear index based on block and thread indices
    size_t idx = blockIdx.y * blockDim.y * nsamp + blockIdx.x * blockDim.x + threadIdx.y * nsamp + threadIdx.x;

    // Use shared memory to optimize memory access
    __shared__ float shared_output[1024]; // Assuming blockDim.x * blockDim.y <= 1024

    // Load data into shared memory
    shared_output[threadIdx.y * blockDim.x + threadIdx.x] = __ldg(&d_output[idx]);

    // Ensure all threads have loaded their data into shared memory
    __syncthreads();

    // Perform the write operation
    d_input[idx] = (unsigned short)shared_output[threadIdx.y * blockDim.x + threadIdx.x];
}